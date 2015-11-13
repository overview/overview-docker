#/bin/bash

cd "$(dirname "$0")"/..

# Support services
docker build --rm -t overview/database database
docker build --rm -t overview/searchindex searchindex

# Create a base with everything built and staged
docker build --rm -t overview/overview-base overview-base

docker build --rm -t overview/db-evolution-applier db-evolution-applier
docker build --rm -t overview/documentset-worker documentset-worker
docker build --rm -t overview/worker worker
docker build --rm -t overview/web web
