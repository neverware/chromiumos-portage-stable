# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/SGMLSpm/SGMLSpm-1.03-r7.ebuild,v 1.13 2014/04/06 14:55:39 vapier Exp $

EAPI=5

inherit eutils perl-module

MY_P="${P}ii"
S=${WORKDIR}/${PN}

DESCRIPTION="Perl library for parsing the output of nsgmls"
HOMEPAGE="http://search.cpan.org/author/DMEGG/SGMLSpm-1.03ii/"
SRC_URI="mirror://cpan/authors/id/D/DM/DMEGG/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

src_prepare() {
	cp "${FILESDIR}"/Makefile.PL "${S}"/Makefile.PL || die
	epatch "${FILESDIR}"/sgmlspl.patch
	mv sgmlspl{.pl,} || die
}
