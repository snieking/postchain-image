#!/usr/bin/env bash

DB_URL=$(cat /usr/src/rell/config/node-config.properties | grep "^database.url=")
PORT=$(echo $DB_URL | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')

if ! [ -z "$PORT" ]
then
  export PGPORT=$PORT
fi

if [[ "$DB_URL" == *"localhost"* ]] || [[ "$DB_URL" == *"127.0.0.1"* ]]
then
  echo "Starting local postgres server ..."
  postgres-entrypoint.sh postgres &
else
  echo "Running with external postgres server configured in your node-config.properties"
fi

if [ $1 == "test" ]
then
  test.sh
else
  build.sh
  run-node.sh
fi