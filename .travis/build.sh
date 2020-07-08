#!/bin/sh

set -xve

if ! [ -d "librdkafka" ]; then
  git clone --depth 1 --branch "${LIBRDKAFKA_VERSION:-v1.2.2}" "${LIBRDKAFKA_REPOSITORY_URL:-https://github.com/edenhill/librdkafka.git}"
fi

(
  cd librdkafka
  ./configure
  make
  sudo make install
)
sudo ldconfig

echo "extension = $(pwd)/modules/rdkafka.so" >> ~/.phpenv/versions/$(phpenv version-name)/etc/php.ini
phpenv config-rm xdebug.ini || true

phpize
CFLAGS=$PHP_RDKAFKA_CFLAGS ./configure
make
