#!/usr/bin/env bash

PORT=$(cat /usr/src/rell/config/node-config.properties | grep "^database.url=" | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')

if ! [ -z "$PORT" ]
then
  export PGPORT=$PORT
fi

apk fix

postgres-entrypoint.sh postgres &


if [ $1 == "test" ]
then
  test.sh
else
  build.sh
  run-node.sh
fi