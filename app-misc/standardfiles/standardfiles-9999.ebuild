# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_12 )

MY_P=python-${P}

inherit git-r3 distutils-r1

DESCRIPTION="Program to convert video, audio and images to standard files"
HOMEPAGE="https://gitlab.com/HansvonHohenstaufen/standardfiles"

EGIT_REPO_URI="https://gitlab.com/HansvonHohenstaufen/standardfiles"
EGIT_BRANCH="develop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

DEPEND="
	app-portage/gentoolkit
	media-gfx/imagemagick
	media-video/ffmpeg
	dev-python/python-magic
	media-gfx/farbfeld
"
RDEPEND="${DEPEND}"
BDEPEND=""
