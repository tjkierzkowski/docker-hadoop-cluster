all:
	docker build -t lewuathe/hadoop-base:latest hadoop-base
	docker build -t lewuathe/hadoop-master:latest hadoop-master
	docker build -t lewuathe/hadoop-slave:latest hadoop-slave
	docker build -f hadoop-hive/Dockerfile hadoop-hive
	docker-compose build

.PHONY: test clean

run:
	docker-compose up -d
	echo "http://localhost:9870 for HDFS"
	echo "http://localhost:8088 for YARN"
	echo "http://localhost:10000 for HIVE"

down:
	docker-compose down
