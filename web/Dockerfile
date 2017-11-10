FROM overview/overview-base

EXPOSE 9000

CMD ["/usr/bin/java", \
       "-cp", "web/*", \
        "-Dfile.encoding=UTF8", \
        "-Duser.timezone=UTC", \
        "-Dpidfile.path=/dev/null", \
        "play.core.server.ProdServerStart"]
