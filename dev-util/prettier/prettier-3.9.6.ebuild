# Copyright 2019-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=9

DESCRIPTION="Prettier is an opinionated code formatter"
HOMEPAGE="https://prettier.io/"
SRC_URI="
	https://registry.npmjs.org/${PN}/-/${P}.tgz
"

S="${WORKDIR}/package"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="net-libs/nodejs"
BDEPEND="net-libs/nodejs[npm]"

NPM_FLAGS=(
	--prefix "${ED}/usr"
	--audit false
	--color false
	--foreground-scripts
	--global
	--offline
	--progress false
	--save false
	--verbose
)

src_compile() {
	# Skip, nothing to compile here.
	:
}

src_install() {
	npm "${NPM_FLAGS[@]}" install "${DISTDIR}/${P}.tgz" || die
	dodoc *.md
}
