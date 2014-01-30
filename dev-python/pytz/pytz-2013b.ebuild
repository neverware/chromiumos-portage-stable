# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pytz/pytz-2013b.ebuild,v 1.14 2013/09/05 18:46:15 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy2_0 )
inherit distutils-r1

DESCRIPTION="World timezone definitions for Python"
HOMEPAGE="http://pypi.python.org/pypi/pytz http://pytz.sourceforge.net/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	>=sys-libs/timezone-data-${PV}"
RDEPEND="${DEPEND}"

DOCS=( CHANGES.txt )

PATCHES=(
	# Use timezone-data zoneinfo.
	"${FILESDIR}/${PN}-2009j-zoneinfo.patch"
	# ...and do not install a copy of it.
	"${FILESDIR}/${PN}-2009h-zoneinfo-noinstall.patch"
)

python_test() {
	"${PYTHON}" pytz/tests/test_tzinfo.py
}

python_install() {
	distutils-r1_python_install
}
