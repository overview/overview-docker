FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-8-jre-headless \
  unzip 

ENV LC_ALL=C.UTF-8

RUN \
  mkdir /opt/overview && \
  curl https://overview-builds.overviewdocs.com/6d9a8b334a75f7b87bcd45b525e1b517961b17ac.zip -o /opt/overview/production.zip

RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

WORKDIR /opt/overview
