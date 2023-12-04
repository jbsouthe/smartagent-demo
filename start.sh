#!/bin/bash

mkdir /usr/share/tomcat9/logs
ln -s /usr/share/tomcat9/etc /usr/share/tomcat9/conf
cd /usr/share/tomcat9/bin

/tmp/loadgen.sh &

./catalina.sh run
