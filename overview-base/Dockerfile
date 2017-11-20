FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-8-jre-headless \
  unzip 

ENV LC_ALL=C.UTF-8

RUN \
  mkdir /opt/overview && \
  curl https://overview-builds.overviewdocs.com/61516f74b6bb259e487e96015ec8efd734d5821c.zip -o /opt/overview/production.zip

RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

WORKDIR /opt/overview
