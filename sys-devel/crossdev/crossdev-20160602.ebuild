# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
inherit eutils

if [[ ${PV} == "99999999" ]] ; then
	EGIT_REPO_URI="git://anongit.gentoo.org/proj/crossdev.git"
	inherit git-2
	SRC_URI=""
	#KEYWORDS=""
else
	SRC_URI="mirror://gentoo/${P}.tar.xz
		https://dev.gentoo.org/~vapier/dist/${P}.tar.xz"
	KEYWORDS="*"
fi

DESCRIPTION="Gentoo Cross-toolchain generator"
HOMEPAGE="https://www.gentoo.org/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=sys-apps/portage-2.1
	>=app-portage/portage-utils-0.55
	app-shells/bash
	sys-apps/gentoo-functions
	!sys-devel/crossdev-wrappers"
DEPEND="app-arch/xz-utils"

src_prepare() {
	epatch "${FILESDIR}"/use-new-path-for-functions.sh.patch
}

src_install() {
	default
	if [[ "${PV}" == "99999999" ]] ; then
		sed -i "s:@CDEVPV@:${EGIT_VERSION}:" "${ED}"/usr/bin/crossdev || die
	fi
}
