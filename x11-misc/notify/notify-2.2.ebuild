# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit savedconfig toolchain-funcs

DESCRIPTION="Simple notification daemon"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/notify"
SRC_URI="https://gitlab.com/HansvonHohenstaufen/notify/-/archive/v2.2/notify-v2.2.tar.gz"

S="${WORKDIR}/notify-v2.2"

LICENSE="MIT"
SLOT="0"
IUSE="tcc"
KEYWORDS="~amd64"
RESTRICT="mirror"

DEPEND="x11-misc/dzen"
RDEPEND="${DEPEND}"
BDEPEND="tcc? ( dev-lang/tcc )"

src_prepare() {
	default

	if use !elibc_musl; then
		echo "Only compile in musl profile"
		die
	fi

	sed -i \
		-e 's|^ @|  |g' \
		-e 's|@${CC}|$(CC)|g' \
		-e '/^  echo/d' \
		Makefile || die

	if use !tcc; then
		sed -i \
			-e "s/ -Os / /" \
			-e "/^\(LDFLAGS\|CFLAGS\)/{s| = | += |g;s|-s ||g}" \
			config.mk || die
	fi

	restore_config config.h
}

src_compile() {
	if use tcc; then
		emake CC="tcc"
	else
		emake CC="$(tc-getCC)"
	fi
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	save_config config.h
}
