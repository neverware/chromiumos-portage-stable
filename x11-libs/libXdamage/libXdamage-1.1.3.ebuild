# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libXdamage/libXdamage-1.1.3.ebuild,v 1.9 2010/10/21 01:15:57 ranger Exp $

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org Xdamage library"

KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXfixes
	>=x11-proto/damageproto-1.1
	x11-proto/xproto"
DEPEND="${RDEPEND}"
