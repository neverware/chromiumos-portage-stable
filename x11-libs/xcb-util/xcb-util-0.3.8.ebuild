# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/xcb-util/xcb-util-0.3.8.ebuild,v 1.8 2011/08/20 15:50:12 jer Exp $

EAPI=4

XORG_MODULE=/
XORG_BASE_INDIVIDUAL_URI=http://xcb.freedesktop.org/dist
XORG_DOC=doc
inherit xorg-2

EGIT_REPO_URI="git://anongit.freedesktop.org/git/xcb/util"
EGIT_HAS_SUBMODULES=yes

DESCRIPTION="X C-language Bindings sample implementations"
HOMEPAGE="http://xcb.freedesktop.org/"

KEYWORDS="*"
IUSE="test"

RDEPEND=">=x11-libs/libxcb-1.7
	x11-proto/xproto"
DEPEND="${RDEPEND}
	>=dev-util/gperf-3.0.1
	test? ( >=dev-libs/check-0.9.4 )"

PDEPEND="
	>=x11-libs/xcb-util-image-${PV}
	>=x11-libs/xcb-util-keysyms-${PV}
	>=x11-libs/xcb-util-renderutil-${PV}
	>=x11-libs/xcb-util-wm-${PV}
"

pkg_setup() {
	XORG_CONFIGURE_OPTIONS=(
		$(use_with doc doxygen)
	)

	xorg-2_pkg_setup
}
