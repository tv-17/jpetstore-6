# Pull base image
From tomcat:8-jre8

# Maintainer
MAINTAINER "Thivan Visvanathan thivan@ecs-digital.co.uk">

# Copy to images tomcat path
ADD target/jpetstore.war /usr/local/tomcat/webapps/