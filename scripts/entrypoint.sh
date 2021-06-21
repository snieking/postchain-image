#!/usr/bin/env bash

postgres-entrypoint.sh postgres &
build.sh
run-node.sh