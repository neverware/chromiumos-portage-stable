# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libserialport/libserialport-0.1.0.ebuild,v 1.1 2014/06/12 19:56:28 vapier Exp $

EAPI=4

inherit eutils

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://sigrok.org/${PN}"
	inherit git-2 autotools
else
	SRC_URI="http://sigrok.org/download/source/${PN}/${P}.tar.gz"
	KEYWORDS="*"
fi

DESCRIPTION="Cross platform serial port access library"
HOMEPAGE="http://sigrok.org/"

LICENSE="GPL-3"
SLOT="0"
IUSE="static-libs udev"

RDEPEND="udev? ( virtual/libudev )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	[[ ${PV} == "9999" ]] && eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		$(use_with udev libudev)
}

src_install() {
	default
	prune_libtool_files
}
