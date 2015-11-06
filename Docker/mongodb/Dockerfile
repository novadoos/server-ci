FROM ubuntu:latest

MAINTAINER mrtrom

VOLUME ["/data/mongodb"]

EXPOSE 27017

# Installs mongodb
RUN apt-get -y update && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
	echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list && \
	apt-get -y update && \
	apt-get -y install apt-utils \
		htop \ 
		mongodb-org=3.0.7 \
		mongodb-org-server=3.0.7 \
		mongodb-org-shell=3.0.7 \
		mongodb-org-mongos=3.0.7 \
		mongodb-org-tools=3.0.7

# Create mongodb folder
RUN mkdir -p /data/db