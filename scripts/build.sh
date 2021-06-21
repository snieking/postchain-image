#!/bin/bash

# This script produces blockchain configurations which
# include Rell source code

set -eu

echo "Compiling Development blockchain..."
exec multigen.sh /usr/src/rell/run.xml --source-dir=/usr/src/rell/src --output-dir=/usr/src/rell/target
echo "Successfully compiled Development blockchain!"
