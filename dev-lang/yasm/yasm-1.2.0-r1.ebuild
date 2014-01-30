# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/yasm/yasm-1.2.0-r1.ebuild,v 1.1 2013/01/15 17:31:52 vapier Exp $

EAPI=4
PYTHON_DEPEND="python? 2:2.7"
inherit autotools eutils python

DESCRIPTION="An assembler for x86 and x86_64 instruction sets"
HOMEPAGE="http://yasm.tortall.net/"
SRC_URI="http://www.tortall.net/projects/yasm/releases/${P}.tar.gz
	mirror://gentoo/${P}-x32.patch.xz"

LICENSE="BSD-2 BSD || ( Artistic GPL-2 LGPL-2 )"
SLOT="0"
KEYWORDS="*"
IUSE="nls python"

RDEPEND="nls? ( virtual/libintl )"
DEPEND="nls? ( sys-devel/gettext )
	python? ( >=dev-python/cython-0.14 )"

DOCS=( AUTHORS )

pkg_setup() {
	if use python; then
		python_set_active_version 2
		python_pkg_setup
	fi
}

src_prepare() {
	epatch "${WORKDIR}"/${P}-x32.patch #435838
	chmod a+rx modules/objfmts/elf/tests/{gas,}x32/*_test.sh
	epatch "${FILESDIR}/${P}-fix_cython_check.patch"
	# ksh doesn't grok $(xxx), makes aclocal fail
	sed -i -e '1c\#!/usr/bin/env sh' YASM-VERSION-GEN.sh || die
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable python) \
		$(use_enable python python-bindings) \
		$(use_enable nls)
}
