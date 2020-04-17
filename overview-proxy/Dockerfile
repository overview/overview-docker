FROM traefik:v2.2.0
ENTRYPOINT []

EXPOSE 80 443 9000 3000 3001 3003 3004 3005
COPY /overview-proxy /
COPY /traefik/ /traefik/
CMD [ "/overview-proxy" ]
