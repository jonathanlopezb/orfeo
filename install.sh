#!/bin/sh

# Script para realizar la instalacion base de orfeo

echo "Comienza la instalacion \n" && sleep 10

apt-get update && apt-get upgrade -y

echo "Por favor lea con mucha atencion el siguiente mensaje: \n" && sleep 10

sudo apt install libtie-ixhash-perl libalgorithm-diff-perl libalgorithm-merge-perl libalgorithm-c3-perl php-bz2 php-cgi php-codecoverage php-common php-date php-deepcopy php-doctrine-instantiator php-dompdf php-file-iterator php-font-lib php-fpdf php-gd php-gnupg php-http-request php-http php-igbinary php-imagick php-imap php-intl php-json-schema php-ldap php-mail-mime php-mail php-mailparse php-mbstring php-mdb2-driver-mysql php-mdb2-driver-pgsql php-mdb2 php-memcache php-memcached php-msgpack php-mysql php-net-dns2 php-net-ftp php-net-nntp php-net-smtp php-net-socket php-net-url2 php-net-url php-pear php-pgsql php-phar-io-manifest php-phar-io-version php-php-gettext php-phpdocumentor-reflection-common php-phpdocumentor-reflection-docblock php-phpdocumentor-type-resolver php-phpspec-prophecy php-propro php-pspe php-raphf php-rrd php-soap php-text-template php-timer php-token-stream php-tokenizer php-validate php-webmozart-assert php-xml php-xmlrpc php-zip orfeo kuine-apache2 kuine-common kuine-fail2ban kuine-gui kuine-kuane kuine-lapp kuine-livecd kuine-pgsql-repository kuine-pgsql-webmin kuine-pgsql kuine-repository kuine-webmin laptop-detect less libaacs0 libabw-0.1-1 libacl1 libaio1 libalgorithm-diff-xs-perl libaom0  libapache2-mod-evasive libapache2-mod-php7.3 libapache2-mod-php libapache2-mod-security2 libapparmor1 libappstream4 libapr1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libaprutil1 libapt-inst2.0 libapt-pkg-perl libapt-pkg5.0 libarchive-cpio-perl libarchive-zip-perllibargon2-1 libasan5libasound2-data libasound2 libaspell15 libass9 libassuan0 -y

echo "Terminado el proceso \n" && sleep 10
