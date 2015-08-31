#!/bin/bash

## Waits for the overview server to become available
## Uses the IP embedded in the $DOCKER_HOST environment variable, or
## localhost, if not set.
## 

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


