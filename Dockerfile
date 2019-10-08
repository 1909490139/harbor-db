FROM photon:2.0

ENV PGDATA /var/lib/postgresql/data

RUN tdnf install -y shadow gzip postgresql >> /dev/null\
    && groupadd -r postgres --gid=999 \
    && useradd -m -r -g postgres --uid=999 postgres

RUN tdnf erase -y toybox && tdnf install -y util-linux net-tools

VOLUME /var/lib/postgresql/data

COPY ./test.sh /docker-entrypoint.sh
RUN chown -R postgres:postgres /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]

EXPOSE 5432
USER postgres
