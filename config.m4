dnl $Id$
dnl config.m4 for extension rdkafka

PHP_ARG_WITH(rdkafka, for rdkafka support,
[  --with-rdkafka             Include rdkafka support])

if test "$PHP_RDKAFKA" != "no"; then
  PHP_SUBST(RDKAFKA_SHARED_LIBADD)
  CPPFLAGS="$CPPFLAGS -Wall -Wsign-compare -Wfloat-equal -Wpointer-arith -Wcast-align -llz4  -lm -lzstd  -lsasl2  -lssl  -lcrypto -L/lib -lz  -ldl -lpthread -lrt -lpthread -lrt"
  RDKAFKA_SOURCE_DIR="lib/librdkafka/src"
  SOURCES="${RDKAFKA_SOURCE_DIR}/crc32c.c \
  ${RDKAFKA_SOURCE_DIR}/lz4.c \
  ${RDKAFKA_SOURCE_DIR}/lz4frame.c \
  ${RDKAFKA_SOURCE_DIR}/lz4hc.c \
  ${RDKAFKA_SOURCE_DIR}/rdaddr.c \
  ${RDKAFKA_SOURCE_DIR}/rdavl.c \
  ${RDKAFKA_SOURCE_DIR}/rdbuf.c \
  ${RDKAFKA_SOURCE_DIR}/rdcrc32.c \
  ${RDKAFKA_SOURCE_DIR}/rddl.c \
  ${RDKAFKA_SOURCE_DIR}/rdhdrhistogram.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_assignor.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_background.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_broker.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_buf.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_cert.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_cgrp.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_conf.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_coord.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_error.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_event.c \
  ${RDKAFKA_SOURCE_DIR}/rdfnv1a.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_feature.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_idempotence.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_lz4.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_metadata.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_metadata_cache.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_mock_handlers.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_mock.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_mock_cgrp.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_msg.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_msgset_reader.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_msgset_writer.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_offset.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_op.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_partition.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_pattern.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_plugin.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_queue.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_range_assignor.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_request.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_roundrobin_assignor.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_zstd.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_sasl_cyrus.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_sasl.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_sasl_oauthbearer.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_sasl_plain.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_sasl_scram.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_ssl.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_subscription.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_timer.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_txnmgr.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_topic.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_transport.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_interceptor.c \
  ${RDKAFKA_SOURCE_DIR}/rdkafka_header.c \
  ${RDKAFKA_SOURCE_DIR}/rdlist.c \
  ${RDKAFKA_SOURCE_DIR}/rdlog.c \
  ${RDKAFKA_SOURCE_DIR}/rdmurmur2.c \
  ${RDKAFKA_SOURCE_DIR}/rdports.c \
  ${RDKAFKA_SOURCE_DIR}/rdrand.c \
  ${RDKAFKA_SOURCE_DIR}/rdregex.c \
  ${RDKAFKA_SOURCE_DIR}/rdstring.c \
  ${RDKAFKA_SOURCE_DIR}/rdunittest.c \
  ${RDKAFKA_SOURCE_DIR}/rdvarint.c \
  ${RDKAFKA_SOURCE_DIR}/snappy.c \
  ${RDKAFKA_SOURCE_DIR}/tinycthread.c \
  ${RDKAFKA_SOURCE_DIR}/tinycthread_extra.c \
  ${RDKAFKA_SOURCE_DIR}/rdgz.c \
  ${RDKAFKA_SOURCE_DIR}/rdxxhash.c"
  SOURCES="$SOURCES rdkafka.c metadata.c metadata_broker.c metadata_topic.c metadata_partition.c metadata_collection.c compat.c conf.c topic.c queue.c message.c fun.c kafka_consumer.c topic_partition.c"

  AC_DEFINE(HAVE_RDKAFKALIB,1,[ ])
  AC_DEFINE(HAVE_RD_KAFKA_MESSAGE_HEADERS,1,[ ])
  AC_DEFINE(HAS_RD_KAFKA_PURGE,1,[ ])
  AC_DEFINE(HAS_RD_KAFKA_PARTITIONER_MURMUR2,1,[ ])

  PHP_NEW_EXTENSION(rdkafka, $SOURCES, $ext_shared,,-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
  PHP_ADD_BUILD_DIR(lib/librdkafka/src)
fi
