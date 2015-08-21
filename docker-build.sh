#/bin/bash

cd "$(dirname "$0")"


# Support services
docker build -t overview/database database
docker build -t overview/message-broker message-broker


# Create a base with everything built and staged
docker build -t overview/overview-base  overview-base

# Overview services
docker build -t overview/db-evolution-applier db-evolution-applier
docker build -t overview/documentset-worker documentset-worker
docker build -t overview/worker worker

docker build -t overview/web web
