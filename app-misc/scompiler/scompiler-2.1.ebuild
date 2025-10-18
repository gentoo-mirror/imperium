# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

MY_P=python-${P}

inherit distutils-r1

DESCRIPTION="Simple fast compiler helper"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/scompiler"
SRC_URI="
	https://gitlab.com/HansvonHohenstaufen/scompiler/-/archive/v2.1/scompiler-v2.1.tar.gz
		-> ${MY_P}.tar.gz
"

S="${WORKDIR}/scompiler-v2.1"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
