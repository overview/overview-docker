#!/bin/bash

export PGUSER=overview
export PGPASSWORD=overview

# Extract the IP address from $DOCKER_HOST
# If $DOCKER_HOST is not set, use localhost
PLUGIN_HOST=$(echo ${DOCKER_HOST:-localhost} | sed 's/[a-zA-Z]*:\/\/\(.*\):.*/http:\/\/\1/')

psql -h overview-database -p 5432 <<EOF

INSERT INTO plugin (id, name, description, url, autocreate, autocreate_order)                   
  SELECT '90115025-9C9E-4BA7-A9B7-6C9BB69A27BF',
   'Word Cloud', 'Shows common words, sized by frequency', 
   '$PLUGIN_HOST:3000', true, 2 
  WHERE NOT EXISTS (SELECT 1 FROM plugin WHERE id = '90115025-9C9E-4BA7-A9B7-6C9BB69A27BF');


INSERT INTO plugin (id, name, description, url, autocreate, autocreate_order) 
  SELECT  '0E131156-E9F9-4976-B980-B0BAE916E3B6',
   'Entities', 'Lists the places and names that appear in the documents',
   '$PLUGIN_HOST:3001', false, 0
  WHERE NOT EXISTS (SELECT 1 FROM plugin WHERE id = '0E131156-E9F9-4976-B980-B0BAE916E3B6');


INSERT INTO plugin (id, name, description, url, autocreate, autocreate_order)
  SELECT '3444C389-F235-4DC8-BC0C-C8B7A1B66630',
   'Regex Search', 'Find by regular expressions',
   '$PLUGIN_HOST:3002', false, 0
  WHERE NOT EXISTS (SELECT 1 FROM plugin WHERE id = '3444C389-F235-4DC8-BC0C-C8B7A1B66630');


INSERT INTO plugin (id, name, description, url, autocreate, autocreate_order)
  SELECT 'B077BD4B-8B99-49E8-A628-9B9EA3336E57',
   'Folders', 'Browse by the folders documents were uploaded from',
   '$PLUGIN_HOST:3003', false, 0
  WHERE NOT EXISTS (SELECT 1 FROM plugin WHERE id = 'B077BD4B-8B99-49E8-A628-9B9EA3336E57');

EOF

