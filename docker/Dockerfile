FROM postgres:14-alpine as dumper
COPY iracelog_testdata.sql /docker-entrypoint-initdb.d/

RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=password
ENV PGDATA=/data

RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]


FROM postgres:14-alpine 
COPY --from=dumper /data $PGDATA


