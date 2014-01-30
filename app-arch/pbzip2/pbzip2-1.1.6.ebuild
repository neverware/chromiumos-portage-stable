# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/pbzip2/pbzip2-1.1.6.ebuild,v 1.2 2012/07/15 18:24:16 vapier Exp $

EAPI=4

inherit flag-o-matic eutils

DESCRIPTION="Parallel bzip2 (de)compressor using libbz2"
HOMEPAGE="http://compression.ca/pbzip2/"
SRC_URI="http://compression.ca/${PN}/${P}.tar.gz"

LICENSE="BZIP2"
SLOT="0"
KEYWORDS="*"
IUSE="static symlink"

LIB_DEPEND="app-arch/bzip2[static-libs(+)]"
RDEPEND="!static? ( ${LIB_DEPEND//\[static-libs(+)]} )"
DEPEND="${RDEPEND}
	static? ( ${LIB_DEPEND} )"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.1.6-makefile.patch
	tc-export CXX
	use static && append-ldflags -static
}

src_install() {
	dobin pbzip2
	dodoc AUTHORS ChangeLog README
	doman pbzip2.1
	dosym pbzip2 /usr/bin/pbunzip2

	if use symlink ; then
		local s
		for s in bzip2 bunzip2 bzcat ; do
			dosym pbzip2 /usr/bin/${s}
		done
	fi
}
