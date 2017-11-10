#/bin/bash

set -e

cd "$(dirname "$0")"

# Support services
docker build --rm -t overview/database ../database

# Create a base with everything built and staged
docker build --rm -t overview/overview-base ../overview-base

docker build --rm -t overview/db-evolution-applier ../db-evolution-applier
docker build --rm -t overview/worker ../worker
docker build --rm -t overview/web ../web
