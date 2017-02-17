FROM ubuntu:vivid

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-8-jre-headless \
  unzip

RUN locale-gen en_US.UTF-8

ENV LC_ALL=en_US.UTF-8

RUN \
  mkdir /opt/overview && \
  curl https://s3.amazonaws.com/overview-builds/8d2d4441210e26cf8f946a4a5565958ff0335a76.zip -o /opt/overview/production.zip

WORKDIR /opt/overview
