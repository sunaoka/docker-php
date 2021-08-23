# PHP Docker Images

## What's this?

This is an unofficial [Alpine Linux](https://alpinelinux.org/) based PHP Docker images
with all possible extensions and [composer](https://getcomposer.org/) installed
on the [official PHP Docker images](https://hub.docker.com/_/php/).

The curl extension also supports HTTP/2.0.

## Usage

```bash
docker run -it --rm sunaoka/php:8.0.9-alpine php
```

The usage is the same as the [official PHP Docker images](https://hub.docker.com/_/php/).

## Supported PHP version

- [x] PHP 5.5.38
- [x] PHP 5.6.40
- [x] PHP 7.0.33
- [x] PHP 7.1.33
- [x] PHP 7.2.34
- [x] PHP 7.3.29
- [x] PHP 7.4.22
- [x] PHP 8.0.9

## Installed extensions

The installed extensions are listed in the table below.

And, only extensions marked with * are enabled by default.

| Extension      |   5.5   |   5.6   |   7.0   |   7.1   |   7.2   |   7.3   |   7.4   |   8.0   |
| :------------- | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----: |
| amqp           |         | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| apcu *         | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| apcu_bc        |         |         | &check; | &check; | &check; | &check; | &check; |         |
| ast            |         |         | &check; | &check; | &check; | &check; | &check; | &check; |
| bcmath *       | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| blackfire      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| bz2 *          | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| calendar *     | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| cmark          |         |         | &check; | &check; | &check; | &check; | &check; |         |
| csv            |         |         |         |         |         | &check; | &check; | &check; |
| dba *          | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| decimal        |         |         | &check; | &check; | &check; | &check; | &check; | &check; |
| ds             |         |         | &check; | &check; | &check; | &check; | &check; | &check; |
| enchant        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| ev             | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| event          | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| excimer        |         |         |         | &check; | &check; | &check; | &check; | &check; |
| exif *         | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| ffi *          |         |         |         |         |         |         | &check; | &check; |
| gd *           | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| gearman        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| geoip          | &check; | &check; | &check; | &check; | &check; | &check; | &check; |         |
| geospatial     | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| gettext *      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| gmagick        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| gmp *          | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| gnupg          | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| grpc           | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| http           | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| igbinary       | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| imagick *      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| imap           | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| inotify        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| interbase      |         |         |         |         |         |         |         |         |
| intl *         | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| ioncube_loader | &check; | &check; | &check; | &check; | &check; | &check; | &check; |         |
| jsmin          | &check; | &check; | &check; | &check; | &check; | &check; | &check; |         |
| json_post      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| ldap *         | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| lzf            | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| mailparse      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| maxminddb      |         |         |         |         | &check; | &check; | &check; | &check; |
| mcrypt *       | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| memcache       | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| memcached *    | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| mongo          | &check; | &check; |         |         |         |         |         |         |
| mongodb        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| mosquitto      | &check; | &check; | &check; | &check; | &check; | &check; | &check; |         |
| msgpack        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| mssql          | &check; | &check; |         |         |         |         |         |         |
| mysql          | &check; | &check; |         |         |         |         |         |         |
| mysqli *       | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| oauth          | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| oci8           |         |         |         |         |         |         |         |         |
| odbc           | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| opcache *      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| opencensus     |         |         | &check; | &check; | &check; | &check; | &check; | &check; |
| pcntl          | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| pcov *         |         |         | &check; | &check; | &check; | &check; | &check; | &check; |
| pdo_dblib *    | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| pdo_firebird   |         |         |         |         |         |         |         |         |
| pdo_mysql *    | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| pdo_oci        |    -    |    -    |         |         |         |         |         |         |
| pdo_odbc *     | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| pdo_pgsql *    | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| pdo_sqlsrv     |         |         | &check; | &check; | &check; | &check; | &check; | &check; |
| pgsql *        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| propro         | &check; | &check; | &check; | &check; | &check; | &check; | &check; |         |
| protobuf       | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| pspell *       | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| raphf          | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| rdkafka        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| recode         | &check; | &check; | &check; | &check; | &check; | &check; |         |         |
| redis *        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| seaslog        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| shmop *        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| smbclient      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| snmp           | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| snuffleupagus  |         |         | &check; | &check; | &check; | &check; | &check; | &check; |
| soap *         | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| sockets *      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| solr           | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| spx            |         | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| sqlsrv         |         |         | &check; | &check; | &check; | &check; | &check; | &check; |
| ssh2           | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| stomp          | &check; | &check; | &check; | &check; | &check; | &check; | &check; |         |
| swoole         | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| sybase_ct      | &check; | &check; |         |         |         |         |         |         |
| sysvmsg *      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| sysvsem *      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| sysvshm *      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| tensor         |         |         |         |         | &check; | &check; | &check; | &check; |
| tidy *         | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| timezonedb     | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| uopz           | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| uploadprogress | &check; | &check; | &check; | &check; | &check; | &check; | &check; |         |
| uuid *         | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| vips           |         |         | &check; | &check; | &check; | &check; | &check; | &check; |
| wddx           | &check; | &check; | &check; | &check; | &check; | &check; |         |         |
| xdebug *       | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| xhprof         | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| xlswriter      |         |         | &check; | &check; | &check; | &check; | &check; | &check; |
| xmldiff        | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| xmlrpc         | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| xsl *          | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| yac            |         |         | &check; | &check; | &check; | &check; | &check; | &check; |
| yaml           | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| yar            | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| zip *          | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| zookeeper      | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |
| zstd           | &check; | &check; | &check; | &check; | &check; | &check; | &check; | &check; |

## File tree

### /usr/local/bin

PHP binaries, composer and installer.

```text
/usr/local/bin
├── composer
└── PHP binaries (php, pear, etc.)
```

### /usr/local/lib/php/extensions/no-debug-non-zts-YYYYMMDD

Extensions.

```text
/usr/local/lib/php/extensions/no-debug-non-zts-YYYYMMDD
└── *.so
```

### /usr/local/etc/php

Configuration file.

```text
/usr/local/etc/php
├── conf.d
│   └── *.ini
├── php.ini-development
└── php.ini-production
```
