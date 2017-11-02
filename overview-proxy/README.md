# Overview Proxy

Exposes Overview's web server and plugins on localhost -- and
optionally through SSL to the world.

# Usage

This image is made to be run by [overview-local](https://github.com/overview/overview-local).
Here's what overview-local does:

1. `overview-local` starts a bunch of Docker-container HTTP servers:
   `overview-web`, `overview-plugin-word-cloud`, etc.
1. `overview-local` will maybe set the `OV_DOMAIN_NAME` environment variable.
1. `overview-local` starts `overview-proxy` within the same network. Manually,
   the command might be:
   `docker run --network overviewlocal_default --volumes overview-acme:/var/lib/acme -P --rm overview/overview-proxy`

`overview-proxy` will listen on several ports:

* HTTP requests on ports 9000 and 3000-3005: forwarded to `overview-web` and
  plugin containers, chosen by port. For instance, port 3000 is forwarded to
  `overview-plugin-word-cloud`.
* HTTP requests on port 443: forwarded to `overview-web` and plugin containers,
  chosen by SSL [SNI](https://en.wikipedia.org/wiki/Server_Name_Indication)
  (domain name).
* HTTP requests on port 80: `/.well-known/acme-challenge/` is forwarded to
  [ACME](https://hlandau.github.io/acme/) to supply free SSL certificates (via
  [Let's Encrypt](https://letsencrypt.org/). Other requests are redirected to
  HTTPS.

# Easy, Free SSL

By default, `overview-proxy` won't handle SSL requests: you'll only be able to
access `http://localhost:9000` (overview-web), `http://localhost:3000`
(`overview-plugin-word-cloud`), and so forth. Requests on ports 80 and 443
will fail.

If you set an environment variable `OV_DOMAIN_NAME`, though, things change.
Assuming you set it to `overview.example.com`, `overview-proxy` will go
through several steps while the proxy is started.

Run `docker logs -f overview-proxy` to see its progress through the steps.

1. You need to create a DNS `A`, `AAAA` or `CNAME` record for
   `overview.example.com`, pointing somewhere you control. `overview-proxy`
   will look up the address every few seconds until you do.
2. You need packets routed from the Internet to `overview.example.com:80` to
   reach your `overview-proxy` container on port 80 and
   `overview.example.com:443` to reach your `overview-proxy` container on
   port 443. (You may need to administer both your Internet router _and_
   the computer you're running Docker on.) Every few seconds,
   `overview-proxy` will try to generate an SSL certificate using Let's
   Encrypt until networking is working.
3. `overview-proxy` will start accepting SSL requests for
   `overview.example.com`.
4. Now you need to repeat steps 1 and 2 for each plugin:
   `overview-plugin-word-cloud.example.com`,
   `overview-plugin-multi-search.example.com`,
   `overview-plugin-entity-filter.example.com`
   and `overview-plugin-file-browser.example.com`. (We add
   "`-plugin-word-cloud`" before the first dot in `OV_DOMAIN_NAME`.)

Daily, `overview-proxy` will renew SSL certificates that are nearly expired.
