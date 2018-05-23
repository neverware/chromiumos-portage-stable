# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Fuse-filesystem utilizing the sftp service"
HOMEPAGE="https://github.com/libfuse/sshfs"
SRC_URI="https://github.com/libfuse/${PN}/releases/download/${PN}_${PV}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="*"
SLOT="0"

CDEPEND=">=sys-fs/fuse-2.6.0_pre3
	!sys-fs/sshfs-fuse
	>=dev-libs/glib-2.4.2"
RDEPEND="${CDEPEND}
	>=net-misc/openssh-4.4"
DEPEND="${CDEPEND}
	virtual/pkgconfig"

DOCS=( ChangeLog AUTHORS )
