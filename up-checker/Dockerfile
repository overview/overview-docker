FROM postgres:9.4

RUN apt-get update && apt-get install -y \
  wget

COPY upcheck.sh .

ENTRYPOINT ["./upcheck.sh"]

