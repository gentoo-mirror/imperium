# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_12 )

MY_P=python-${P}

inherit distutils-r1

DESCRIPTION="simple update gentoo"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/updategentoo"
SRC_URI="
	https://gitlab.com/HansvonHohenstaufen/updategentoo/-/archive/v2.0/updategentoo-v2.0.tar.gz
		-> ${MY_P}.tar.gz
"

S="${WORKDIR}/updategentoo-v2.0"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
