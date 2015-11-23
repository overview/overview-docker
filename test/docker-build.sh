#/bin/bash

cd "$(dirname "$0")"

# Support services
docker build --no-cache --rm -t overview/database database
docker build --no-cache --rm -t overview/searchindex searchindex

# Create a base with everything built and staged
docker build --no-cache --rm -t overview/overview-base overview-base

docker build --no-cache --rm -t overview/db-evolution-applier db-evolution-applier
docker build --no-cache --rm -t overview/documentset-worker documentset-worker
docker build --no-cache --rm -t overview/worker worker
docker build --no-cache --rm -t overview/web web
