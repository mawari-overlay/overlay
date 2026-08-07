# Copyright 2019-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg wrapper

MY_PN="${PN//-bin}"
RN="DbGate"

DESCRIPTION="Database manager for MySQL, PostgreSQL, SQL Server, MongoDB, SQLite and others. Runs under Windows, Linux, Mac or as web application"
HOMEPAGE="https://www.dbgate.io/"
SRC_URI="
	amd64? ( https://github.com/dbgate/dbgate/releases/download/v${PV}/dbgate-${PV}-linux_amd64.deb )
"

S="${WORKDIR}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~amd64"

RESTRICT="bindist mirror"

RDEPEND="
	app-accessibility/at-spi2-core:2
	dev-libs/nss
	media-libs/alsa-lib
	net-print/cups
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3
	x11-libs/pango
	x11-libs/libdrm
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/libXScrnSaver
	${DEPEND}
"

QA_PREBUILT="*"

src_install() {
	mv "${S}"/* "${ED}" || die

	mv "${ED}/usr/share/doc/${MY_PN}" "${ED}/usr/share/doc/${PF}" || die
	make_wrapper ${MY_PN} "/opt/${RN}/${MY_PN}" "" "/opt/${RN}" "/opt/bin/"
}
