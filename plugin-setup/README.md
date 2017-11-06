Add Plugins
===========

Inserts entries in the `plugin` table for officially supported plugins.
Uses `$DOCKER_HOST` to create the URL where plugins can be reached. If 
`$DOCKER_HOST` is not defined, we're probably running on linux, so `localhost`
is used as the host name. The ports are hard-coded, and have to be defined to 
match when running the plugins:

- Word cloud: 3000
- Entities: 3001
- Folders: 3003
- Multisearch: 3004
- Metadata: 3005

## Dependencies

Links to:
- Postgres server named `overview-database` listening on port 5432.
