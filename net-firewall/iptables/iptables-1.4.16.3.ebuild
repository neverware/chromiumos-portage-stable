# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-firewall/iptables/iptables-1.4.16.3.ebuild,v 1.6 2013/02/08 14:30:33 jer Exp $

EAPI="4"

# Force users doing their own patches to install their own tools
AUTOTOOLS_AUTO_DEPEND=no

inherit eutils multilib toolchain-funcs autotools

DESCRIPTION="Linux kernel (2.4+) firewall, NAT and packet mangling tools"
HOMEPAGE="http://www.iptables.org/"
SRC_URI="http://iptables.org/projects/iptables/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="ipv6 netlink static-libs"

RDEPEND="
	netlink? ( net-libs/libnfnetlink )
"
DEPEND="${RDEPEND}
	virtual/os-headers
	virtual/pkgconfig
"

src_prepare() {
	# use the saner headers from the kernel
	rm -f include/linux/{kernel,types}.h

	# Only run autotools if user patched something
	epatch_user && eautoreconf || elibtoolize
}

src_configure() {
	sed -i \
		-e "/nfnetlink=[01]/s:=[01]:=$(usex netlink 1 0):" \
		configure || die

	econf \
		--sbindir="${EPREFIX}/sbin" \
		--libexecdir="${EPREFIX}/$(get_libdir)" \
		--enable-devel \
		--enable-shared \
		$(use_enable static-libs static) \
		$(use_enable ipv6)
}

src_compile() {
	emake V=1
}

src_install() {
	default
	dodoc INCOMPATIBILITIES iptables/iptables.xslt

	# all the iptables binaries are in /sbin, so might as well
	# put these small files in with them
	into /
	dosbin iptables/iptables-apply
	dosym iptables-apply /sbin/ip6tables-apply
	doman iptables/iptables-apply.8

	insinto /usr/include
	doins include/iptables.h $(use ipv6 && echo include/ip6tables.h)
	insinto /usr/include/iptables
	doins include/iptables/internal.h

	keepdir /var/lib/iptables
	newinitd "${FILESDIR}"/${PN}-1.4.13-r1.init iptables
	newconfd "${FILESDIR}"/${PN}-1.4.13.confd iptables
	if use ipv6 ; then
		keepdir /var/lib/ip6tables
		newinitd "${FILESDIR}"/iptables-1.4.13-r1.init ip6tables
		newconfd "${FILESDIR}"/ip6tables-1.4.13.confd ip6tables
	fi

	# Move important libs to /lib
	gen_usr_ldscript -a ip{4,6}tc iptc xtables
	find "${ED}" -type f -name '*.la' -exec rm -rf '{}' '+' || die "la removal failed"
}