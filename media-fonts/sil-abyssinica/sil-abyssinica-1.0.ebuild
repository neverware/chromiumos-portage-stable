# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-fonts/sil-abyssinica/sil-abyssinica-1.0.ebuild,v 1.1 2008/05/19 18:46:05 dirtyepic Exp $

inherit font

DESCRIPTION="SIL Opentype Unicode fonts for Ethiopic languages"
HOMEPAGE="http://scripts.sil.org/AbyssinicaSIL"
SRC_URI="mirror://gentoo/ttf-${P}.tgz"

LICENSE="OFL"
SLOT="0"
KEYWORDS="*"
IUSE="doc"

DOCS="OFL-FAQ.txt"
FONT_SUFFIX="ttf"

FONT_S="${WORKDIR}/ttf-${P}"
S="${FONT_S}"

src_install() {
	font_src_install
	use doc && dodoc *.pdf
}
