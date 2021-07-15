#!/usr/bin/env bash

set -e

function get_value_from_properties_file {
  local PROP_FILE=$1
  local PROP_KEY=$2
  local PROP_VALUE=$(cat $PROP_FILE | grep "^$PROP_KEY=" | cut -d= -f2)
  echo "$PROP_VALUE"
}

PORT=$(cat /usr/src/rell/config/node-config.properties | grep "^database.url=" | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')
SCHEMA=$(get_value_from_properties_file /usr/src/rell/config/node-config.properties database.schema)
CHAIN_ID=$(xmllint --xpath 'string(//run/chains/chain/@iid)' /usr/src/rell/$RUN_XML)

BLOCKS_TABLE="c${CHAIN_ID}.blocks"
BLOCK_HEIGHT=$(psql -qtAX -p $PORT --username $POSTGRES_USER --no-password -c "SET search_path to $SCHEMA; SELECT block_height FROM \"$BLOCKS_TABLE\" ORDER BY block_height DESC LIMIT 1;" $POSTGRES_DB)
DEPLOY_HEIGHT=$((BLOCK_HEIGHT + 5))

echo "Current block height is $BLOCK_HEIGHT, new config will be deployed at block height $DEPLOY_HEIGHT"
postchain.sh add-configuration -bc /usr/src/rell/target/blockchains/${CHAIN_ID}/0.xml -h $DEPLOY_HEIGHT -cid ${CHAIN_ID} -nc /usr/src/rell/target/node-config.properties --allow-unknown-signers