FROM overview/overview-base

WORKDIR /opt/overview

CMD ["/usr/bin/java", \
       "-cp", "db-evolution-applier/*", \
        "-Dfile.encoding=UTF8", \
        "-Duser.timezone=UTC", \
        "com.overviewdocs.db_evolution_applier.Main"]
