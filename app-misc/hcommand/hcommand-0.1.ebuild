# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Simple fast command helper"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/hcommand"

SRC_URI="https://gitlab.com/HansvonHohenstaufen/hcommand/-/archive/v0.1/hcommand-v0.1.tar.gz"

S="${WORKDIR}/hcommand-v0.1"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin "${PN}"
}
