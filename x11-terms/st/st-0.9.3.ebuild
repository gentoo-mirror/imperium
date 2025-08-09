# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop savedconfig toolchain-funcs

DESCRIPTION="My fork from suckless st"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/st"
SRC_URI="https://gitlab.com/HansvonHohenstaufen/st/-/archive/v0.9.3/st-v0.9.3.tar.gz"

S="${WORKDIR}/st-v0.9.3"

LICENSE="MIT"
SLOT="10"
KEYWORDS="amd64"
RESTRICT="mirror"

RDEPEND="
	>=sys-libs/ncurses-6.0:0=
	media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXft
	~x11-terms/st-terminfo-${PV}
	!!x11-terms/st:0
"
DEPEND="
	${RDEPEND}
	x11-base/xorg-proto
"
BDEPEND="
	virtual/pkgconfig
"

src_prepare() {
	default

	sed -i \
		-e "s/ -Os / /" \
		-e "/^\(LDFLAGS\|CFLAGS\|CPPFLAGS\)/{s| = | += |g;s|-s ||g}" \
		-e "/^X11LIB/{s:/usr/X11R6/lib:/usr/$(get_libdir)/X11:}" \
		-e '/^X11INC/{s:/usr/X11R6/include:/usr/include/X11:}' \
		config.mk || die

	sed -i \
		-e '/tic/d' \
		Makefile || die

	restore_config config.h
}

src_configure() {
	sed -i \
		-e "s|pkg-config|$(tc-getPKG_CONFIG)|g" \
		config.mk || die

	tc-export CC
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install

	dodoc TODO

	make_desktop_entry ${PN} simpleterm utilities-terminal 'System;TerminalEmulator;' ''

	save_config config.h
}
