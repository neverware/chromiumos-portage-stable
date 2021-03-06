# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit gnome2 multilib-minimal

DESCRIPTION="Library for Neighbor Discovery Protocol"
HOMEPAGE="http://libndp.org"
SRC_URI="http://libndp.org/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

KEYWORDS="*"

DEPEND=""
RDEPEND=""

multilib_src_configure() {
	ECONF_SOURCE="${S}" \
	gnome2_src_configure \
		--disable-static \
		--enable-logging
}
