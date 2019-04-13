#!/bin/bash

echo "-------------------"
echo "hadoop example wordcount"
echo "-------------------"

hadoop dfs -mkdir -p /wordcount/input
hadoop dfs -copyFromLocal /home/vagrant/test/somewords.txt /wordcount/input
hadoop dfs -ls /wordcount/input

hadoop jar  /home/vagrant/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.5.jar wordcount /wordcount/input /wordcount/output





