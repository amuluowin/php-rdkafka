#!/bin/sh

wget http://ftp.man.poznan.pl/apache/kafka/2.3.0/kafka_2.12-2.3.0.tgz
tar -xzf kafka_2.12-2.3.0.tgz
kafka_2.12-2.3.0/bin/zookeeper-server-start.sh -daemon kafka_2.12-2.3.0/config/zookeeper.properties
kafka_2.12-2.3.0/bin/kafka-server-start.sh -daemon kafka_2.12-2.3.0/config/server.properties
