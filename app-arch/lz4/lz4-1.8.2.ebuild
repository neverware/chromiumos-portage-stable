# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-multilib

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/lz4/lz4.git"
	EGIT_BRANCH=dev
else
	SRC_URI="https://github.com/Cyan4973/lz4/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="*"
fi

DESCRIPTION="Extremely Fast Compression algorithm"
HOMEPAGE="https://github.com/lz4/lz4"

LICENSE="BSD-2 GPL-2"
# https://abi-laboratory.pro/tracker/timeline/lz4/
SLOT="0/r131"
IUSE="static-libs"

CMAKE_USE_DIR=${S}/contrib/cmake_unofficial

multilib_src_configure() {
	local mycmakeargs=(
		-DBUILD_STATIC_LIBS=$(usex static-libs)
	)

	cmake-utils_src_configure
}
