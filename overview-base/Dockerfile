FROM ubuntu:vivid

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-8-jre-headless \
  unzip

RUN locale-gen en_US.UTF-8

ENV LC_ALL=en_US.UTF-8

RUN \
  mkdir /opt/overview && \
  curl https://s3.amazonaws.com/overview-builds/46a7ecf1cd6fec67bbb596123aa05d5b5fa02b74.zip -o /opt/overview/production.zip

WORKDIR /opt/overview
