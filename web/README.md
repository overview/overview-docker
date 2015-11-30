

Overview Frontend
=================

The web server that acts as the Overview front end.

## Dependencies

Links to:
- Postgres server named `overview-database` listening on port 5432.
- Searchindex named `overview-searchindex` listening on port 9300.
- Redis host named `overview-redis` listening on port 6379.
- Blob-storage volume shared with the workers, mounted on `/var/lib/overview/blob-storage`.
- Our worker, named `worker`.
