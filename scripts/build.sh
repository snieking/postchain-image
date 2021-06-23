#!/usr/bin/env bash

# This script produces blockchain configurations which
# include Rell source code

set -eu

echo "Compiling blockchain..."
exec multigen.sh /usr/src/rell/$RUN_XML --source-dir=/usr/src/rell/$RELL_SRC --output-dir=/usr/src/rell/target
echo "Successfully compiled blockchain!"
