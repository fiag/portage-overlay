# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PHP_EXT_NAME="redis"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

USE_PHP="php5-5 php5-4"

DOCS="README ChangeLog"

inherit php-ext-source-r2 git-2

DESCRIPTION="This extension provides an API for communicating with Redis servers"
HOMEPAGE="https://github.com/nicolasff/phpredis"
EGIT_REPO_URI="git://github.com/nicolasff/phpredis.git"
EGIT_BRANCH="master"
SRC_URI=""

LICENSE="PHP-3.01"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="igbinary"

DEPEND="igbinary? ( dev-php/igbinary )"
RDEPEND="${DEPEND}"

src_configure() {
	my_conf="--enable-redis
		$(use_enable igbinary redis-igbinary)"

	php-ext-source-r2_src_configure
}

src_unpack() {
    git-2_src_unpack
    local slot orig_s="$S"
    for slot in $(php_get_slots); do
        cp -r "${orig_s}" "${WORKDIR}/${slot}"
    done
}

src_prepare() {
    local slot orig_s="$S"
    for slot in $(php_get_slots); do
        php_init_slot_env ${slot}
        phpize && aclocal && libtoolize --force && autoheader && autoconf
    done
}
