FROM php:7.1.33-alpine

ENV IPE_KEEP_SYSPKG_CACHE 1

ENV PHP_EXTENTIONS \
    amqp \
    apcu \
    apcu_bc \
    ast \
    bcmath \
    blackfire \
    bz2 \
    calendar \
    cmark \
    dba \
    decimal \
    ds \
    enchant \
    ev \
    event \
    excimer \
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
    mongodb \
    mosquitto \
    msgpack \
    mysqli \
    oauth \
    # oci8 \
    odbc \
    opcache \
    opencensus \
    pcntl \
    pcov \
    pdo_dblib \
    # pdo_firebird \
    pdo_mysql \
    # pdo_oci \
    pdo_odbc \
    pdo_pgsql \
    pdo_sqlsrv \
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
    snuffleupagus \
    soap \
    sockets \
    solr \
    spx \
    sqlsrv \
    ssh2 \
    stomp \
    swoole \
    sysvmsg \
    sysvsem \
    sysvshm \
    tidy \
    timezonedb \
    uopz \
    uploadprogress \
    uuid \
    vips \
    wddx \
    xdebug \
    xhprof \
    xlswriter \
    xmldiff \
    xmlrpc \
    xsl \
    yac \
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
    pcov \
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

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions \
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
