FROM overview/overview-base

EXPOSE 9000

RUN \
  export FILENAMES="$(unzip -qq -p production.zip archive/frontend/classpath.txt | \
    sed -e 's/^/archive\/lib\//')" && \
  unzip -qq -d bin -j production.zip $FILENAMES && \
  rm production.zip && \
  /var/lib/dpkg/info/ca-certificates-java.postinst configure

# ...postinst configure seems to be needed to install SSL root certs in the right places after jdk install 
# Otherwise Overview can't contact SMTP server over SSL for password reset -- js 2017-4-4

WORKDIR /opt/overview

CMD ["/usr/bin/java", \
       "-cp", "bin/*", \
        "-Dfile.encoding=UTF8", \
        "-Duser.timezone=UTC", \
        "-Dpidfile.path=/dev/null", \
        "play.core.server.ProdServerStart"]
