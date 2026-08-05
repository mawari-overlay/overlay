# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=9

inherit go-module

DESCRIPTION="Command line interface used by all WakaTime text editor plugins"
HOMEPAGE="https://github.com/wakatime/wakatime-cli"
SRC_URI="https://github.com/wakatime/wakatime-cli/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ricky8955555/mawari-depfiles/releases/download/20260805095241/wakatime-cli-2.23.0-deps.tar.xz"

LICENSE="BSD BSD-2 MIT LGPL-3 Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND=">=dev-lang/go-1.26.5"

src_compile() {
	ego build
}

src_install() {
	dobin wakatime-cli
	default
}
