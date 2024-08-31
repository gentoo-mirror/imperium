# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_12 )

MY_P=python-${P}

inherit distutils-r1

DESCRIPTION="simple fast compiler helper"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/scompiler"
SRC_URI="
	https://gitlab.com/HansvonHohenstaufen/scompiler/-/archive/v1.0/scompiler-v1.0.tar.gz
		-> {MY_P}.tar.gz
"

S="${WORKDIR}/scompiler-v1.0"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-build.patch"
)
