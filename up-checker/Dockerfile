FROM ubuntu:vivid

RUN apt-get update && apt-get install -y \
  wget

COPY upcheck.sh .

CMD ["./upcheck.sh"]
