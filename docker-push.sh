#/bin/bash

docker push overview/database:latest
docker push overview/searchindex:latest
docker push overview/db-evolution-applier:latest
docker push overview/documentset-worker:latest
docker push overview/worker:latest
docker push overview/web:latest
