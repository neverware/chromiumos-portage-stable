# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/socat/socat-1.7.2.2.ebuild,v 1.9 2013/06/09 11:33:43 ago Exp $

EAPI="4"

inherit eutils flag-o-matic autotools toolchain-funcs

DESCRIPTION="Multipurpose relay (SOcket CAT)"
HOMEPAGE="http://www.dest-unreach.org/socat/"
MY_P=${P/_beta/-b}
S="${WORKDIR}/${MY_P}"
SRC_URI="http://www.dest-unreach.org/socat/download/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="ssl readline ipv6 tcpd"

DEPEND="
	ssl? ( >=dev-libs/openssl-0.9.6 )
	readline? ( >=sys-libs/ncurses-5.1 >=sys-libs/readline-4.1 )
	tcpd? ( sys-apps/tcp-wrappers )
"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.7.2.1-long-long.patch #436164
	sed -i test.sh -e "s|/sbin/ifconfig|$(type -P ifconfig)|g" || die
	eautoreconf
}

src_configure() {
	filter-flags '-Wno-error*' #293324
	tc-export AR
	econf \
		$(use_enable ssl openssl) \
		$(use_enable readline) \
		$(use_enable ipv6 ip6) \
		$(use_enable tcpd libwrap)
}

src_test() {
	TMPDIR="${T}" emake test
}

src_install() {
	default

	dodoc BUGREPORTS CHANGES DEVELOPMENT \
		FAQ FILES PORTING README SECURITY VERSION
	docinto examples
	dodoc EXAMPLES *.sh
	dohtml doc/*.html doc/*.css
}
