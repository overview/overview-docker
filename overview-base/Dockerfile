FROM ubuntu:vivid

RUN apt-get update && apt-get install -y \
  curl \
  openjdk-8-jre-headless \
  unzip

RUN locale-gen en_US.UTF-8

# Seems to be needed to install SSL root certs in the right places after jdk install 
# Otherwise Overview can't contact SMTP server over SSL for password reset -- js 2017-4-4
RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

ENV LC_ALL=en_US.UTF-8

RUN \
  mkdir /opt/overview && \
  curl https://s3.amazonaws.com/overview-builds/2a1cac34728171f79ec251af3cf25f35e8b47f18.zip -o /opt/overview/production.zip

WORKDIR /opt/overview
