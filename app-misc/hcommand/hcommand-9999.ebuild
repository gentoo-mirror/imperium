# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 

DESCRIPTION="Simple fast command helper"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/hcommand"

EGIT_REPO_URI="https://gitlab.com/HansvonHohenstaufen/hcommand"
EGIT_BRANCH="develop"

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
