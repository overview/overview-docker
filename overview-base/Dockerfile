FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-8-jre-headless \
  unzip 

ENV LC_ALL=C.UTF-8

RUN \
  mkdir /opt/overview && \
  curl https://s3.amazonaws.com/overview-builds/dffb7b4a8f3e8a114a2e820d1a488630b99d4f90.zip -o /opt/overview/production.zip

RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

WORKDIR /opt/overview
