FROM postgis/postgis

RUN apt-get update \
 && apt-get install -y postgresql-plpython3-${PG_MAJOR} \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN echo 'PGPASSWORD="$POSTGRES_PASSWORD" psql -U $POSTGRES_USER template1 -c "CREATE EXTENSION plpythonu;"' >/docker-entrypoint-initdb.d/plpythonu.sh
