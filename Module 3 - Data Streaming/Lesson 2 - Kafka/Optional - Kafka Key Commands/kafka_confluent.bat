@echo off
cls
:start
echo.
echo. This script starts the required services using the
echo. Confluent v5.0.0 2.11 platform
echo.
echo. Zookeeper needs to started before Kafka in order
echo. to register the Broker(s)
echo.
echo.
echo. 1. Zookeeper
echo. 2. Kafka - Single Broker
echo.
echo.
echo. 3. Create Topic - twitterstream
echo. 4. List Topics
echo. 5. Consumer - Twitter Group
echo. 6. Producer
echo.
echo. 7. Stop Kafka Broker
echo. 8. Exit
echo.
echo.
set /p x= Select an Option:
IF '%x%' == '%x%' GOTO Item_%x%

:Item_1
CD \Confluent-5.0.0\bin\windows\
start  zookeeper-server-start.bat  C:\Confluent-5.0.0\etc\kafka\zookeeper.properties
GOTO Start

:Item_2
CD \Confluent-5.0.0\bin\windows\
start kafka-server-start.bat  C:\Confluent-5.0.0\etc\kafka\server.properties
GOTO Start

:Item_3
CD \Confluent-5.0.0\bin\windows\
start kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic twitterstream
GOTO Start

:Item_4
CD \Confluent-5.0.0\bin\windows\
start kafka-topics.bat --list --zookeeper localhost:2181 
GOTO Start

:Item_5
CD \Confluent-5.0.0\bin\windows\
start kafka-console-consumer.bat --topic twitterstream  --from-beginning  --bootstrap-server localhost:9092 --consumer-property group.id=Twitter-group 
GOTO Start

:Item_6
CD \Confluent-5.0.0\bin\windows\
start kafka-console-producer.bat --broker-list localhost:9092 --topic twitterstream
GOTO Start



:Item_7
CD \Confluent-5.0.0\bin\windows\
start kafka-server-stop.bat
GOTO Start

:Item_8
exit
