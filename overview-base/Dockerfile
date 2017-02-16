FROM ubuntu:vivid

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-8-jre-headless \
  unzip

RUN locale-gen en_US.UTF-8

ENV LC_ALL=en_US.UTF-8

RUN \
  mkdir /opt/overview && \
  curl https://s3.amazonaws.com/overview-builds/74f04a7fb3837814b7541dd1de3a570109c039f9.zip -o /opt/overview/production.zip

WORKDIR /opt/overview
