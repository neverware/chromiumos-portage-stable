# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/eselect-mpg123/eselect-mpg123-0.1.ebuild,v 1.12 2013/08/07 13:24:32 ago Exp $

EAPI=5

DESCRIPTION="Manage /usr/bin/mpg123 symlink"
HOMEPAGE="http://www.gentoo.org/proj/en/eselect/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=">=app-admin/eselect-lib-bin-symlink-0.1.1
	!<media-sound/mpg123-1.14.4-r1"
DEPEND=${RDEPEND}

S=${FILESDIR}

src_install() {
	insinto /usr/share/eselect/modules
	newins mpg123.eselect-${PV} mpg123.eselect
}
