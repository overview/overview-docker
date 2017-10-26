#!/bin/bash

export PGUSER=overview
export PGPASSWORD=overview

# Extract the IP address from $DOCKER_HOST
# If $DOCKER_HOST is not set, use localhost
PLUGIN_HOST=${DOCKER_HOST:-localhost}

psql -h overview-database -p 5432 <<EOF

DELETE FROM plugin WHERE id IN (
  '90115025-9C9E-4BA7-A9B7-6C9BB69A27BF',
  '0E131156-E9F9-4976-B980-B0BAE916E3B6',
  '3444C389-F235-4DC8-BC0C-C8B7A1B66630',
  'B077BD4B-8B99-49E8-A628-9B9EA3336E57',
  '025E3619-EED7-4F99-88BA-A82E5260AF7E'
);

INSERT INTO plugin (id, name, description, url, autocreate, autocreate_order)
VALUES (
  '90115025-9C9E-4BA7-A9B7-6C9BB69A27BF',
  'Word Cloud',
  'Shows common words, sized by frequency',
  'http://$PLUGIN_HOST:3000',
  true,
  2
);

INSERT INTO plugin (id, name, description, url, autocreate, autocreate_order)
VALUES (
  '0E131156-E9F9-4976-B980-B0BAE916E3B6',
  'Entities',
  'Lists the places and names that appear in the documents',
  'http://$PLUGIN_HOST:3001',
  false,
  0
);

INSERT INTO plugin (id, name, description, url, autocreate, autocreate_order)
VALUES (
  'B077BD4B-8B99-49E8-A628-9B9EA3336E57',
  'Folders',
  'Browse by the folders documents were uploaded from',
  'http://$PLUGIN_HOST:3003',
  false,
  0
);

INSERT INTO plugin (id, name, description, url, autocreate, autocreate_order)
VALUES (
  '025E3619-EED7-4F99-88BA-A82E5260AF7E',
  'Multisearch',
  'Searches for lots of things at once',
  'http://$PLUGIN_HOST:3004',
  true,
  1
);

EOF
