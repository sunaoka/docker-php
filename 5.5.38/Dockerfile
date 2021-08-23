FROM alpine:3.7 AS curl

ENV CURL_VERSION 7.78.0

WORKDIR /tmp/curl

RUN apk add --no-cache \
        autoconf \
        ca-certificates \
        g++ \
        gcc \
        make \
        nghttp2-dev \
        openssl-dev \
    && wget -q "https://curl.haxx.se/download/curl-$CURL_VERSION.tar.xz" -O /tmp/curl.tar.xz \
    && tar -Jxf /tmp/curl.tar.xz -C /tmp/curl --strip-components=1 \
    && ./configure \
        --prefix=/usr \
        --enable-ipv6 \
        --enable-unix-sockets \
        --with-openssl \
        --without-libidn \
        --without-libidn2 \
        --with-nghttp2 \
        --disable-ldap \
        --with-pic \
        --without-libssh2 \
    && make -j"$(nproc)" \
    && make install \
    && strip --strip-all /usr/bin/curl /usr/lib/libcurl*.so* \
    && tar -cf /tmp/curl.tar /usr/bin/curl /usr/lib/libcurl*.so*

FROM alpine:3.7

ENV IPE_KEEP_SYSPKG_CACHE 1

ENV PHPIZE_DEPS \
    autoconf \
    file \
    g++ \
    gcc \
    libc-dev \
    make \
    pkgconf \
    re2c

ENV PHP_INI_DIR /usr/local/etc/php

ENV GPG_KEYS 0B96609E270F565C13292B24C13C70B87267B52D 0BD78B5F97500D450838F95DFE857D9A90D90EC1 F38252826ACD957EF380D39F2F7956BC5DA04B5D

ENV PHP_VERSION 5.5.38
ENV PHP_FILENAME php-5.5.38.tar.xz
ENV PHP_SHA256 cb527c44b48343c8557fe2446464ff1d4695155a95601083e5d1f175df95580f

ENV PHP_EXTENTIONS \
    # amqp \
    apcu \
    bcmath \
    blackfire \
    bz2 \
    calendar \
    dba \
    enchant \
    ev \
    event \
    exif \
    gd \
    gearman \
    geoip \
    geospatial \
    gettext \
    gmagick \
    gmp \
    gnupg \
    grpc \
    http \
    igbinary \
    imagick \
    imap \
    inotify \
    # interbase \
    intl \
    ioncube_loader \
    jsmin \
    json_post \
    ldap \
    lzf \
    mailparse \
    mcrypt \
    memcache \
    memcached \
    mongo \
    mongodb \
    mosquitto \
    msgpack \
    mssql \
    mysql \
    mysqli \
    oauth \
    # oci8 \
    odbc \
    opcache \
    pcntl \
    pdo_dblib \
    # pdo_firebird \
    pdo_mysql \
    pdo_odbc \
    pdo_pgsql \
    pgsql \
    propro \
    protobuf \
    pspell \
    raphf \
    rdkafka \
    recode \
    redis \
    seaslog \
    shmop \
    smbclient \
    snmp \
    soap \
    sockets \
    solr \
    ssh2 \
    stomp \
    swoole \
    sybase_ct \
    sysvmsg \
    sysvsem \
    sysvshm \
    tidy \
    timezonedb \
    uopz \
    uploadprogress \
    uuid \
    wddx \
    xdebug \
    xhprof \
    xmldiff \
    xmlrpc \
    xsl \
    yaml \
    yar \
    zip \
    zookeeper \
    zstd \
    @composer

ENV PHP_ENEBLED_EXTENTIONS \
    apcu \
    bcmath \
    bz2 \
    calendar \
    dba \
    exif \
    gd \
    gettext \
    gmp \
    imagick \
    intl \
    ldap \
    mcrypt \
    memcached \
    mysqli \
    opcache \
    pdo_dblib \
    pdo_mysql \
    pdo_odbc \
    pdo_pgsql \
    pgsql \
    pspell \
    redis \
    shmop \
    soap \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    tidy \
    uuid \
    xdebug \
    xsl \
    zip

COPY --from=curl /tmp/curl.tar /usr/src/
COPY --from=php:5.5.38-alpine /usr/local/ /usr/local/
COPY --from=php:5.5.38-alpine /usr/src/php.tar.xz /usr/src/

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions \
    && apk add --no-cache \
        ca-certificates \
        libcurl \
        libedit \
        libxml2 \
        nghttp2 \
        openssl \
    # overwrite libcurl
    && tar -xf /usr/src/curl.tar -C / \
    && for ext in $PHP_EXTENTIONS; do \
            case "$ext" in \
                interbase | pdo_firebird) \
                    if test -f /usr/lib/libfbclient.so; then \
                        mkdir -p /tmp/src/firebird;\
                    fi \
                ;; \
            esac; \
            install-php-extensions "$ext"; \
            rm -f "$PHP_INI_DIR/conf.d"/*; \
        done \
    && for ext in $PHP_ENEBLED_EXTENTIONS; do \
            docker-php-ext-enable "$ext"; \
        done \
    && tar Jxvf /usr/src/php.tar.xz php-$PHP_VERSION/php.ini-development php-$PHP_VERSION/php.ini-production -C $PHP_INI_DIR --strip-components=1 \
    # Removes symbols
    && apk add --no-cache --virtual .binutils binutils \
    && strip --strip-all "$(php-config --extension-dir)"/*.so \
    && apk del .binutils \
    # cleanup
    && apk info --installed .phpize-deps-configure > /dev/null && apk del --purge .phpize-deps-configure || : \
    && apk info --installed .phpize-deps > /dev/null && apk del --purge .phpize-deps || : \
    && apk info --installed g++ > /dev/null && apk del --purge g++ || : \
    && apk info --installed gcc > /dev/null && apk del --purge gcc || : \
    && apk info --installed binutils > /dev/null && apk del --purge binutils || : \
    && apk info -v | grep '\-dev\-' | awk -F'-dev-' '{ print $1"-dev"}' | xargs apk del --purge \
    && rm -rf /usr/local/bin/docker-php-ext-* \
    && rm -rf /usr/local/bin/docker-php-source \
    && rm -rf /usr/local/bin/install-php-extensions \
    && rm -rf /usr/src \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/pear

CMD ["php", "-a"]
