FROM postgres:9.6.10

ENV PGDATA /var/lib/postgresql/data
ENV POSTGRES_PASSWORD=root123

RUN mkdir -p /docker-entrypoint-initdb.d 

COPY ./init-test.sh /docker-entrypoint.sh
COPY ./docker-healthcheck.sh /docker-healthcheck.sh

RUN chown -R postgres:postgres /docker-entrypoint.sh /docker-healthcheck.sh /docker-entrypoint-initdb.d \
    && chmod u+x /docker-entrypoint.sh /docker-healthcheck.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
HEALTHCHECK CMD ["/docker-healthcheck.sh"]

EXPOSE 5432
USER postgres
