#!/usr/bin/env bash

echo "Starting postgres"
postgres-entrypoint.sh postgres &

echo "Building blockchain"
build.sh
echo "Blockchain built"

echo "Starting postchain node"
run-dev-node.sh