FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-8-jre-headless \
  unzip 

ENV LC_ALL=C.UTF-8

RUN \
  mkdir /opt/overview && \
  curl https://overview-builds.overviewdocs.com/6b51a97e2a5cdafc621665a890a6e77bd7fae9f5.zip -o /opt/overview/production.zip

RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

WORKDIR /opt/overview
