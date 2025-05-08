#!/bin/bash

#./XSBench -t 24 -g 20000 -p 20000000 -l 67

pwd

# run_script를 실행합니다
#./run_script.sh --type virtual --pref --input ./benchmark/xsbench/XSBench -t 24 -g 20000 -p 20000000 -l 67
./run_script.sh --type virtual --pref --input ./benchmark/xsbench/XSBench -t 1 -g 20000 -p 100000 -l 67
