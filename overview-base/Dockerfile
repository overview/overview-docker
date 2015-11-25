FROM ubuntu:vivid

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-8-jre-headless \
  unzip

RUN locale-gen en_US.UTF-8

ENV LC_ALL=en_US.UTF-8

RUN \
  mkdir /opt/overview && \
  curl https://s3.amazonaws.com/overview-builds/bfd7b266a28ff91e0a7adfb32bc74ec43c12d5ea.zip -o /opt/overview/production.zip

WORKDIR /opt/overview
