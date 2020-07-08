#!/bin/sh

set -xve

export PATH=$TRAVIS_BUILD_DIR/.travis:$PATH

if [ -n "$MEMORY_CHECK" ]; then
      echo "Enabling memory checking"
      showmem=--show-mem
      checkmem=-m
fi

PHP=$(which php)
REPORT_EXIT_STATUS=1 TEST_PHP_EXECUTABLE="$PHP" "$PHP" run-tests.php -q $checkmem --show-diff $showmem
