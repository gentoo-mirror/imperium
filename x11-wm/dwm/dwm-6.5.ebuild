# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit savedconfig toolchain-funcs

DESCRIPTION="My fork from suckless dwm"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/dwm"
SRC_URI="https://gitlab.com/HansvonHohenstaufen/dwm/-/archive/v6.5/dwm-v6.5.tar.gz"

S="${WORKDIR}/dwm-v6.5"

LICENSE="MIT"
SLOT="10"
IUSE="tcc"
KEYWORDS="amd64"
RESTRICT="mirror"

RDEPEND="
	media-libs/fontconfig
	x11-libs/libX11
	>=x11-libs/libXft-2.3.5
	x11-libs/libXinerama
	!!x11-wm/dwm:0
"
DEPEND="
	${RDEPEND}
	x11-base/xorg-proto
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
			-e "/^\(LDFLAGS\|CFLAGS\|CPPFLAGS\)/{s| = | += |g;s|-s ||g}" \
			-e "/^X11LIB/{s:/usr/X11R6/lib:/usr/$(get_libdir)/X11:}" \
			-e '/^X11INC/{s:/usr/X11R6/include:/usr/include/X11:}' \
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
