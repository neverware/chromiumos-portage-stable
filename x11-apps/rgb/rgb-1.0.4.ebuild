# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/rgb/rgb-1.0.4.ebuild,v 1.9 2011/02/14 14:41:38 xarthisius Exp $

EAPI=3

inherit xorg-2

DESCRIPTION="uncompile an rgb color-name database"

KEYWORDS="*"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}
	x11-proto/xproto"
