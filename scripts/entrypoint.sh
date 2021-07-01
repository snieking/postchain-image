#!/usr/bin/env bash

export PGPORT=$(cat /usr/src/rell/config/node-config.properties | grep "^database.url=" | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')


postgres-entrypoint.sh postgres &


if [ $1 == "test" ]
then
  test.sh
else
  build.sh
  run-node.sh
fi