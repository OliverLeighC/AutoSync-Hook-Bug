#!/usr/bin/env bash

set -exm

docker-entrypoint.sh postgres & 

while ! nc -z localhost 5432; do
  echo "Waiting for PostgreSQL"
  sleep 2
done

# let system databases settle
sleep 9

bash /scripting/baseline-db-all.sh localhost 5432 postgres asupercoolpassword
bash /scripting/migrate-db-all.sh localhost 5432 postgres asupercoolpassword