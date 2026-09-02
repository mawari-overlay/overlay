# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg

DESCRIPTION="A tool to show your key inputs on wayland."
HOMEPAGE="https://github.com/Nakanomk/Seekey"
SRC_URI="https://github.com/Nakanomk/Seekey/archive/refs/tags/v${PV}.tar.gz"

S="${WORKDIR}/Seekey-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64"

DEPEND="
  dev-libs/glib:2
  dev-libs/json-glib
  dev-libs/libevdev
  gui-libs/gtk:4
  gui-libs/gtk4-layer-shell
  sys-libs/glibc
  sys-libs/ncurses
  x11-libs/cairo
  x11-libs/pango
"
RDEPEND="${DEPEND}"
BDEPEND="
  sys-devel/gettext
  dev-util/pkgconf
"

src_test() {
  emake check
}

src_compile() {
  emake PREFIX=/usr
}

src_install() {
  emake DESTDIR="${ED}" PREFIX=/usr install
  dodoc LICENSE README.md
}
