# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/desktop-file-utils/desktop-file-utils-0.22.ebuild,v 1.6 2014/01/14 15:33:56 ago Exp $

EAPI=5
inherit elisp-common eutils

DESCRIPTION="Command line utilities to work with desktop menu entries"
HOMEPAGE="http://freedesktop.org/wiki/Software/desktop-file-utils"
SRC_URI="http://www.freedesktop.org/software/${PN}/releases/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="*"
IUSE="emacs"

RDEPEND=">=dev-libs/glib-2.12:2
	emacs? ( virtual/emacs )"
DEPEND="${RDEPEND}
	app-arch/xz-utils
	virtual/pkgconfig"

SITEFILE=50${PN}-gentoo.el

DOCS=( AUTHORS ChangeLog HACKING NEWS README )

src_prepare() {
	sed -i -e '/SUBDIRS =/s:misc::' Makefile.in || die
}

src_configure() {
	econf "$(use_with emacs lispdir "${SITELISP}"/${PN})"
}

src_compile() {
	default
	use emacs && elisp-compile misc/desktop-entry-mode.el
}

src_install() {
	default
	if use emacs; then
		elisp-install ${PN} misc/*.el misc/*.elc || die
		elisp-site-file-install "${FILESDIR}"/${SITEFILE} || die
	fi
}

pkg_postinst() {
	use emacs && elisp-site-regen
}

pkg_postrm() {
	use emacs && elisp-site-regen
}
