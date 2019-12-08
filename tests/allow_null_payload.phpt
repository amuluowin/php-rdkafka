--TEST--
Allow null payload
--SKIPIF--
<?php
require __DIR__ . '/integration-tests-check.php';
--FILE--
<?php
require __DIR__ . '/integration-tests-check.php';

$topicName = sprintf('test_rdkafka_%s', uniqid());

$producer = new RdKafka\Producer();
$producer->addBrokers(getenv('TEST_KAFKA_BROKERS'));
$topic = $producer->newTopic($topicName);

$topic->produce(0, 0, NULL, 'message_key_1');

while ($producer->getOutQLen() > 0) {
    $producer->poll(50);
}

$consumer = new RdKafka\Consumer();
$consumer->addBrokers(getenv('TEST_KAFKA_BROKERS'));

$topic = $consumer->newTopic($topicName);
$topic->consumeStart(0, RD_KAFKA_OFFSET_BEGINNING);

while (true) {
    $message = $topic->consume(0, 1000);
    if ($message === null) {
        continue;
    }

    if (RD_KAFKA_RESP_ERR_NO_ERROR === $message->err) {
        var_dump($message->payload);
        var_dump($message->key);
        break;
    }
}

$topic->consumeStop(0);

--EXPECTF--
NULL
string(13) "message_key_1"
