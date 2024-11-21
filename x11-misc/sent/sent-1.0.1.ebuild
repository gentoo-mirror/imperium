# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit savedconfig toolchain-funcs

DESCRIPTION="My fork from suckless sent"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/sent"
SRC_URI="https://gitlab.com/HansvonHohenstaufen/sent/-/archive/v1.0.1/sent-v1.0.1.tar.gz"

S="${WORKDIR}/sent-v1.0.1"

LICENSE="MIT"
SLOT="10"
IUSE="tcc"
KEYWORDS="amd64"
RESTRICT="mirror"

DEPEND="
	media-libs/fontconfig
	x11-libs/cairo
	x11-libs/libX11
	x11-libs/libXft
"

RDEPEND="${DEPEND}
	!!x11-misc/sent:0
"
BDEPEND="tcc? ( dev-lang/tcc )"

src_prepare() {
	default

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
