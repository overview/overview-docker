FROM haproxy:1.7.9-alpine

ENV ACMETOOL_VERSION=0.0.61 \
	ACMETOOL_SHA1=e7690f90d16671b3dc786e71c458f0afefecb816

RUN set -x \
	&& apk --no-cache add openssl \
	&& wget -q -O acmetool.tar.gz "https://github.com/hlandau/acme/releases/download/v0.0.61/acmetool-v$ACMETOOL_VERSION-linux_amd64_cgo.tar.gz" \
	&& echo "$ACMETOOL_SHA1 *acmetool.tar.gz" | sha1sum -c \
	&& mkdir -p /usr/src/acmetool \
	&& tar -zxf acmetool.tar.gz -C /usr/src/acmetool --strip-components=1 \
	&& install -m0755 /usr/src/acmetool/bin/acmetool /usr/bin/ \
	&& mkdir -p /usr/share/man/man8 \
	&& install -D /usr/src/acmetool/doc/acmetool.8 /usr/share/man/man8/acmetool.8 \
	&& rm -r acmetool.tar.gz /usr/src/acmetool

EXPOSE 80 443 9000 3000 3001 3003 3004
COPY haproxy-nossl.cfg haproxy-ssl.cfg overview-proxy-nossl overview-proxy-ssl overview-proxy /
CMD [ "/overview-proxy" ]
