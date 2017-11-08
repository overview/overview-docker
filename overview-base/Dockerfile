FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-8-jre-headless \
  unzip 

ENV LC_ALL=C.UTF-8

RUN \
  mkdir /opt/overview && \
  curl https://overview-builds.overviewdocs.com/7d509c50de48a2b0172d13e1a9f47008bf2eda25.zip -o /opt/overview/production.zip

RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

WORKDIR /opt/overview
