# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

MY_P=python-${P}

inherit distutils-r1

DESCRIPTION="Simple update gentoo"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/updategentoo"
SRC_URI="
	https://gitlab.com/HansvonHohenstaufen/updategentoo/-/archive/v5.3/updategentoo-v5.3.tar.gz
		-> ${MY_P}.tar.gz
"

S="${WORKDIR}/updategentoo-v5.3"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror"

DEPEND="app-portage/gentoolkit"
RDEPEND="${DEPEND}"
BDEPEND=""
