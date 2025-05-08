#!/bin/bash

#./XSBench -t 24 -g 20000 -p 20000000 -l 67

pwd

# run_script를 실행합니다
./run_script.sh --type virtual --pref --input ./benchmark/redis/redis-server ./benchmark/redis/redis.conf &
sleep 10

# YCSB를 실행합니다
cd /home/koo/src/YCSB
./bin/ycsb load redis -s -P workloads/workloadd_valgrind -p "redis.host=127.0.0.1" -p "redis.port=6379" -p "redis.timeout=10000000" -threads 100
./bin/ycsb run redis -s -P workloads/workloadd_valgrind -p "redis.host=127.0.0.1" -p "redis.port=6379" -p "redis.timeout=10000000" -threads 100
cd -

# kill process
pid_redis=$(sudo ps -e | grep callgrind | awk '{print $1}')
kill $pid_redis
