# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit savedconfig toolchain-funcs

DESCRIPTION="Simple notification daemon"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/notify"
SRC_URI="https://gitlab.com/HansvonHohenstaufen/notify/-/archive/v2.1/notify-v2.1.tar.gz"

S="${WORKDIR}/notify-v2.1"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="x11-misc/dzen"
RDEPEND="${DEPEND}"
BDEPEND="dev-lang/tcc"

src_prepare() {
	default

	sed -i \
		-e 's|^ @|  |g' \
		-e 's|@${CC}|$(CC)|g' \
		-e '/^  echo/d' \
		Makefile || die

	restore_config config.h
}

src_compile() {
	emake CC="tcc"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	save_config config.h
}
