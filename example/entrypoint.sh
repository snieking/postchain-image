#!/usr/bin/env bash

echo "Starting postgres"
service postgresql start
service postgresql status

echo "Executing build script"
./build.sh

echo "Starting blockchain..."
./run-dev-node.sh