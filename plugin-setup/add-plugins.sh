#!/bin/sh

# Find URLs of plugins, to set as iframes. The plugins will all have the
# Overview server set at 'http://overview-web:9000' (an internal address).
if [ -n "$OV_DOMAIN_NAME" ]; then
  # Best: `OV_DOMAIN_NAME` is set. We will auto-generate URLs based on that.

  SUBDOMAIN_ENDINGS="plugin-entity-filter plugin-file-browser plugin-multi-search plugin-word-cloud"
  dns_name="$(echo "$OV_DOMAIN_NAME" | cut -d. -f1)"
  dns_domain="$(echo "$OV_DOMAIN_NAME" | cut -d. -f2-)"

  ENTITY_FILTER_URL="https://$dns_name-plugin-entity-filter.$dns_domain"
  MULTI_SEARCH_URL="https://$dns_name-plugin-multi-search.$dns_domain"
  FILE_BROWSER_URL="https://$dns_name-plugin-file-browser.$dns_domain"
  WORD_CLOUD_URL="https://$dns_name-plugin-word-cloud.$dns_domain"
elif [ -n "$DOCKER_HOST" ]; then
  echo 'DEPRECATED: do not set $DOCKER_HOST any more. Use $OV_DOMAIN_NAME instead.' 1>&2
  ENTITY_FILTER_URL="http://$DOCKER_HOST:3001"
  MULTI_SEARCH_URL="http://$DOCKER_HOST:3004"
  FILE_BROWSER_URL="http://$DOCKER_HOST:3003"
  WORD_CLOUD_URL="http://$DOCKER_HOST:3000"
else
  ENTITY_FILTER_URL="http://localhost:3001"
  MULTI_SEARCH_URL="http://localhost:3004"
  FILE_BROWSER_URL="http://localhost:3003"
  WORD_CLOUD_URL="http://localhost:3000"
fi

echo "Setting up plugin URLs."
echo "Word Cloud: $WORD_CLOUD_URL"
echo "Entity Filter: $ENTITY_FILTER_URL"
echo "File Browser: $FILE_BROWSER_URL"
echo "Multi Search: $MULTI_SEARCH_URL"
echo "These are internal URLs: they will give errors if you browse to them. They are printed here to help with debugging."

PGUSER=overview PGPASSWORD=overview psql -h overview-database -p 5432 <<EOF

DELETE FROM plugin WHERE id IN (
  '90115025-9C9E-4BA7-A9B7-6C9BB69A27BF',
  '0E131156-E9F9-4976-B980-B0BAE916E3B6',
  '3444C389-F235-4DC8-BC0C-C8B7A1B66630',
  'B077BD4B-8B99-49E8-A628-9B9EA3336E57',
  '025E3619-EED7-4F99-88BA-A82E5260AF7E'
);

INSERT INTO plugin (id, name, description, url, server_url_from_plugin, autocreate, autocreate_order)
VALUES (
  '90115025-9C9E-4BA7-A9B7-6C9BB69A27BF',
  'Word Cloud',
  'Shows common words, sized by frequency',
  '$WORD_CLOUD_URL',
  'http://overview-web:9000',
  true,
  2
);

INSERT INTO plugin (id, name, description, url, server_url_from_plugin, autocreate, autocreate_order)
VALUES (
  '0E131156-E9F9-4976-B980-B0BAE916E3B6',
  'Entities',
  'Lists the places and names that appear in the documents',
  '$ENTITY_FILTER_URL',
  'http://overview-web:9000',
  false,
  0
);

INSERT INTO plugin (id, name, description, url, server_url_from_plugin, autocreate, autocreate_order)
VALUES (
  'B077BD4B-8B99-49E8-A628-9B9EA3336E57',
  'Folders',
  'Browse by the folders documents were uploaded from',
  '$FILE_BROWSER_URL',
  'http://overview-web:9000',
  false,
  0
);

INSERT INTO plugin (id, name, description, url, server_url_from_plugin, autocreate, autocreate_order)
VALUES (
  '025E3619-EED7-4F99-88BA-A82E5260AF7E',
  'Multisearch',
  'Searches for lots of things at once',
  '$MULTI_SEARCH_URL',
  'http://overview-web:9000',
  true,
  1
);

EOF
