# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/mtools/mtools-4.0.15.ebuild,v 1.8 2011/06/19 16:59:24 armin76 Exp $

EAPI="2"

inherit autotools

DESCRIPTION="utilities to access MS-DOS disks from Unix without mounting them"
HOMEPAGE="http://mtools.linux.lu/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="X"

DEPEND="
	X? (
		x11-libs/libICE
		x11-libs/libXau
		x11-libs/libSM
		x11-libs/libX11
		x11-libs/libXt
	)"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoconf #341443
}

src_configure() {
	econf \
		--sysconfdir=/etc/mtools \
		$(use_with X x)
}

src_install() {
	emake -j1 DESTDIR="${D}" install || die
	insinto /etc/mtools
	doins mtools.conf || die
	dosed '/^SAMPLE FILE$/s:^:#:' /etc/mtools/mtools.conf # default is fine
	dodoc README* Release.notes
}
