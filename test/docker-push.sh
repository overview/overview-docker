#/bin/bash

docker push overview/database:latest
docker push overview/redis:latest
docker push overview/db-evolution-applier:latest
docker push overview/worker:latest
docker push overview/web:latest
