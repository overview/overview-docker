#!/bin/bash

## Waits for the overview server to become available
## Uses the IP embedded in the $DOCKER_HOST environment variable, or
## localhost, if not set.
## 



wait_for_frontend() {

  service_is_down=true

  PLUGIN_HOST=$(echo ${DOCKER_HOST:-localhost} | sed 's/[a-zA-Z]*:\/\/\(.*\):.*/\1/')

  url=http://${PLUGIN_HOST}:9000

  while [ ${service_is_down} == true ]; do
    echo Waiting for server at $url
    sleep 1

    wget -q -O /dev/null $url

    if [ $? == 0 ]; then
      service_is_down=false
    fi
  done

  echo The server is available at $url
}

wait_for_database() {
  export PGUSER=overview
  export PGPASSWORD=overview
  
  service_is_down=true

  while [ ${service_is_down} == true ]; do 
    echo Waiting for overview-database
    sleep 1

    psql -h overview-database -p 5432 -l &> /dev/null

    if [ $? == 0 ]; then
      service_is_down=false
    fi
  done

  echo overview-database is available
}


if [ "$1" == "frontend" ]; then
  wait_for_frontend
elif [ "$1" == "database" ]; then
  wait_for_database
else 
  echo "Usage: upcheck [frontend|database]"
fi





