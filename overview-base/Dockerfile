FROM ubuntu:vivid

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-8-jre-headless \
  unzip

RUN locale-gen en_US.UTF-8

ENV LC_ALL=en_US.UTF-8

RUN \
  mkdir /opt/overview && \
  curl https://s3.amazonaws.com/overview-builds/65314d0e5002926d16cc3f182e29698ad32f56ee.zip -o /opt/overview/production.zip

WORKDIR /opt/overview
