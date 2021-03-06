# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/m17n-db/m17n-db-1.6.2.ebuild,v 1.1 2011/04/04 00:59:04 flameeyes Exp $

EAPI=4

inherit eutils

DESCRIPTION="Database for the m17n library"
HOMEPAGE="http://www.m17n.org/m17n-lib/"
SRC_URI="http://www.m17n.org/m17n-lib-download/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="sys-devel/gettext"
RDEPEND="virtual/libintl"

src_prepare() {
	epatch "${FILESDIR}"/do-not-commit-extra-space.patch
}

src_install() {
	emake DESTDIR="${D}" install || die

	dodoc AUTHORS ChangeLog NEWS README
	docinto FORMATS; dodoc FORMATS/*
	docinto UNIDATA; dodoc UNIDATA/*
}
