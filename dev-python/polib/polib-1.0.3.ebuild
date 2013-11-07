# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="A library to manipulate, create, modify gettext files (pot, po and mo files)."
HOMEPAGE="http://pypi.python.org/pypi/polib/"
SRC_URI="https://bitbucket.org/izi/polib/downloads/polib-1.0.3.tar.gz 
         mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
