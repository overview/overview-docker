
Overview Worker
===============

The process that handles clustering, and also some document imports (sigh).


## Dependencies

Links to:
- Postgres server named `overview-database` listening on port 5432.
- Searchindex named `overview-searchindex` listening on port 9300
- Blob-storage volume shared with the workers, mounted on `/var/lib/overview/blob-storage`.
