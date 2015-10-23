# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/dropbear/dropbear-2012.55.ebuild,v 1.12 2012/08/12 03:56:20 vapier Exp $

EAPI="4"

inherit eutils savedconfig pam user

DESCRIPTION="small SSH 2 client/server designed for small memory environments"
HOMEPAGE="http://matt.ucc.asn.au/dropbear/dropbear.html"
SRC_URI="http://matt.ucc.asn.au/dropbear/releases/${P}.tar.bz2
	http://matt.ucc.asn.au/dropbear/testing/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="bsdpty minimal multicall pam static syslog zlib"

LIB_DEPEND="zlib? ( sys-libs/zlib[static-libs(+)] )
	dev-libs/libtommath[static-libs(+)]"
RDEPEND="!static? ( ${LIB_DEPEND//\[static-libs(+)]} )
	pam? ( virtual/pam )"
DEPEND="${RDEPEND}
	static? ( ${LIB_DEPEND} )"
RDEPEND+=" pam? ( >=sys-auth/pambase-20080219.1 )"

REQUIRED_USE="pam? ( !static )"

set_options() {
	progs=(
		dropbear dbclient dropbearkey
		$(usex minimal "" "dropbearconvert scp")
	)
	makeopts=(
		MULTI=$(usex multicall 1 0)
		STATIC=$(usex static 1 0)
	)
}

src_prepare() {
	epatch "${FILESDIR}"/dropbear-0.46-dbscp.patch
	sed -i \
		-e '/SFTPSERVER_PATH/s:".*":"/usr/lib/misc/sftp-server":' \
		-e '/XAUTH_COMMAND/s:/X11R6/:/:' \
		options.h
	sed -i \
		-e '/pam_start/s:sshd:dropbear:' \
		svr-authpam.c || die
	restore_config options.h
}

src_configure() {
	econf \
		$(use_enable zlib) \
		$(use_enable pam) \
		$(use_enable !bsdpty openpty) \
		$(use_enable syslog)
}

src_compile() {
	set_options
	emake ${makeopts[@]} PROGRAMS="${progs[*]}"
}

src_install() {
	set_options
	emake install DESTDIR="${D}" ${makeopts[@]} PROGRAMS="${progs[*]}"
	doman *.8
	newinitd "${FILESDIR}"/dropbear.init.d dropbear
	newconfd "${FILESDIR}"/dropbear.conf.d dropbear
	dodoc CHANGES README TODO SMALL MULTI

	# The multi install target does not install the links
	if use multicall ; then
		cd "${ED}"/usr/bin
		local x
		for x in ${progs[@]} ; do
			ln -s dropbearmulti ${x} || die "ln -s dropbearmulti to ${x} failed"
		done
		rm -f dropbear
		dodir /usr/sbin
		dosym ../bin/dropbearmulti /usr/sbin/dropbear
		cd "${S}"
	fi
	save_config options.h

	if ! use minimal ; then
		mv "${ED}"/usr/bin/{,db}scp || die
	fi

	pamd_mimic system-remote-login dropbear auth account password session
}

pkg_preinst() {
	enewgroup sshd 22
	enewuser sshd 22 -1 /var/empty sshd
}