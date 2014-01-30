# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/python-argparse/python-argparse-0.ebuild,v 1.6 2013/09/13 21:41:27 mgorny Exp $

EAPI=4
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )
inherit python-r1

DESCRIPTION="A virtual for the Python argparse module"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep "dev-python/argparse" python2_6)"
