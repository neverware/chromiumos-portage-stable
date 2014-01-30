# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/xsetroot/xsetroot-1.1.0.ebuild,v 1.10 2012/05/15 14:23:20 aballier Exp $

EAPI=3

inherit xorg-2

DESCRIPTION="X.Org xsetroot application"

KEYWORDS="*"
IUSE=""
RDEPEND="x11-libs/libXmu
	x11-libs/libX11
	x11-misc/xbitmaps
	x11-libs/libXcursor"
DEPEND="${RDEPEND}"
