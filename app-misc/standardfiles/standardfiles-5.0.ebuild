# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_12 )

MY_P=python-${P}

inherit distutils-r1

DESCRIPTION="program to convert video, audio and images to standard files"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/standard"
SRC_URI="
	https://gitlab.com/HansvonHohenstaufen/standard/-/archive/v5.0/standard-v5.0.tar.gz
		-> ${MY_P}.tar.gz
"

S="${WORKDIR}/standard-v5.0"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror"

DEPEND="
	app-portage/gentoolkit
	media-gfx/imagemagick
	media-video/ffmpeg
"
RDEPEND="${DEPEND}"
BDEPEND=""
