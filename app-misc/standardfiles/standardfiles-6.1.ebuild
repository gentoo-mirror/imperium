# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

MY_P=python-${P}

inherit distutils-r1

DESCRIPTION="Program to convert video, audio and images to standard files"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/standardfiles"
SRC_URI="
	https://gitlab.com/HansvonHohenstaufen/standardfiles/-/archive/v6.1/standardfiles-v6.1.tar.gz
		-> ${MY_P}.tar.gz
"

S="${WORKDIR}/standardfiles-v6.1"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror"

DEPEND="
	media-gfx/imagemagick
	media-video/ffmpeg
	dev-python/python-magic
	media-gfx/farbfeld
"
RDEPEND="${DEPEND}"
BDEPEND=""
