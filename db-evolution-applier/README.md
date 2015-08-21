
Database Evolution Applier
==========================

After the database is setup, evolutions must be applied to setup the structures that the Overview components expect. The db-evolution-applier needs to run, and finish, after the database is started, but before the Overview services are started.

The db-evolution-applier only needs to be run once after each update. There is no harm in running it multiple times.

## Dependencies

Links to:
- Postgres server named `overview-database` listening on port 5432.


