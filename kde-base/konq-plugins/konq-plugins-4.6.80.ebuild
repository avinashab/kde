# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

KMNAME="kde-baseapps"
inherit kde4-meta

DESCRIPTION="Various plugins for konqueror"
HOMEPAGE="http://kde.org/"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="debug tidy"

DEPEND="
	$(add_kdebase_dep libkonq)
	tidy? ( app-text/htmltidy )
"
RDEPEND="${DEPEND}
	!kdeprefix? ( !kde-misc/konq-plugins )
	$(add_kdebase_dep kcmshell)
	$(add_kdebase_dep konqueror)
"

src_configure() {
	mycmakeargs=(
		-DKdeWebKit=OFF
		-DWebKitPart=OFF
		$(cmake-utils_use_with tidy LibTidy)
	)

	kde4-meta_src_configure
}
