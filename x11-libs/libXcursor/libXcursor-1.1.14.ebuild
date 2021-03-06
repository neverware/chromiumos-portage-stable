# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libXcursor/libXcursor-1.1.14.ebuild,v 1.1 2013/06/24 12:32:56 chithanh Exp $

EAPI=4

XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xcursor library"

KEYWORDS="*"
IUSE=""

RDEPEND=">=x11-libs/libXrender-0.8.2
	x11-libs/libXfixes
	x11-libs/libX11"
DEPEND="${RDEPEND}"

XORG_CONFIGURE_OPTIONS=(
	--with-icondir=/usr/share/cursors/xorg-x11
	--with-cursorpath='~/.cursors:~/.icons:/usr/local/share/cursors/xorg-x11:/usr/local/share/cursors:/usr/local/share/icons:/usr/local/share/pixmaps:/usr/share/cursors/xorg-x11:/usr/share/cursors:/usr/share/pixmaps/xorg-x11:/usr/share/icons:/usr/share/pixmaps'
)
