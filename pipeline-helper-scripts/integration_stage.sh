#!/bin/bash
PATH=/opt/maven/bin:${PATH}
nohup mvn cargo:run -P tomcat85 2>&1 > /dev/null &
sleep 3