#!/usr/bin/env bash

postgres-entrypoint.sh postgres &


if [ $1 == "test" ]
then
  test.sh
else
  build.sh
  run-node.sh
fi