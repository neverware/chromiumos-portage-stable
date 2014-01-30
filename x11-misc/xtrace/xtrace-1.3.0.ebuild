# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xtrace/xtrace-1.3.0.ebuild,v 1.3 2013/10/18 21:59:32 vapier Exp $

EAPI=4

inherit autotools-utils

MY_CODE="3694"

DESCRIPTION="X11 protocol trace utility"
HOMEPAGE="http://xtrace.alioth.debian.org/"
SRC_URI="https://alioth.debian.org/frs/download.php/${MY_CODE}/${P/-/_}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

DOCS=(AUTHORS ChangeLog README NEWS)

src_configure() {
	local myeconfargs=(
		--program-transform-name="s/^x/x11/"
	)

	autotools-utils_src_configure
}

pkg_postinst () {
	einfo "To avoid collision with glibc (/usr/bin/xtrace)"
	einfo "binary was renamed to x11trace, as suggested by author"
}
