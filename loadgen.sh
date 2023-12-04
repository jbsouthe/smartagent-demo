#!/bin/bash
sleep 60
while true
do
	wget -q http://localhost:8080/api || echo "bad return: $?"
	sleep 10
done
