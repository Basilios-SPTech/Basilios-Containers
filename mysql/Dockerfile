FROM mysql:8.0

COPY ./init-scripts/ /docker-entrypoint-initdb.d/

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
    CMD mysqladmin ping -h localhost -u root -p${MYSQL_ROOT_PASSWORD} || exit 1
