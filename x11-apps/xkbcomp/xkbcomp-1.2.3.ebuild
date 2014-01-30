# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/xkbcomp/xkbcomp-1.2.3.ebuild,v 1.7 2011/10/03 17:56:28 josejx Exp $

EAPI=4

inherit xorg-2

DESCRIPTION="compile XKB keyboard description"
KEYWORDS="*"
IUSE=""
RDEPEND="x11-libs/libX11
	x11-libs/libxkbfile"
DEPEND="${RDEPEND}
	sys-devel/bison"
