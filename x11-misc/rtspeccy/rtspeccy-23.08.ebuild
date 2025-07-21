# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Real time audio spectrum analyzer"
HOMEPAGE="https://www.uninformativ.de/git/rtspeccy/file/README.html"
SRC_URI="https://www.uninformativ.de/git/rtspeccy/archives/rtspeccy-v23.08.tar.gz"

S="${WORKDIR}/rtspeccy-v23.08"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	cp config.h.example config.h || die
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${D}" prefix="${EPREFIX}/usr" install
}
