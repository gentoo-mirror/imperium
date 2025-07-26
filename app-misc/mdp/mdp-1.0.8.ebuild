# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="A command-line based markdown presentation tool"
HOMEPAGE="https://github.com/visit1985/mdp.git"
SRC_URI="https://github.com/visit1985/mdp/archive/refs/tags/1.0.18.tar.gz"

S="${WORKDIR}/mdp-1.0.18"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default

	sed -i \
		-e 's|^ @|  |g' \
		-e 's|@${CC}|$(CC)|g' \
		-e '/^  echo/d' \
		Makefile || die

}

src_compile() {
	emake CC="$(tc-getCC)" LSB_RELEASE="Debian" CFLAGS="-ltinfow"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
