# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=9

MY_PN="${PN//-bin}"

DESCRIPTION="HTML Validator, Formatter, LSP, and Templating Language Library"
HOMEPAGE="https://github.com/kristoff-it/superhtml"
SRC_URI="
	amd64? ( https://github.com/kristoff-it/superhtml/releases/download/v${PV}/x86_64-linux-musl.tar.xz -> ${P}-amd64.tar.xz )
	arm64? ( https://github.com/kristoff-it/superhtml/releases/download/v${PV}/aarch64-linux.tar.xz -> ${P}-arm64.tar.xz )
"

S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"

RESTRICT="bindist mirror"

QA_PREBUILT="*"

src_install() {
	dobin "${MY_PN}"
}
