#!/usr/bin/env bash

set -e

CHAIN_ID=$(xmllint --xpath 'string(//run/chains/chain/@iid)' /usr/src/rell/$RUN_XML)

BLOCKS_TABLE="c${CHAIN_ID}.blocks"
BLOCK_HEIGHT=$(psql -qtAX --username "$POSTGRES_USER" --no-password -c "SET search_path to blockchain; SELECT block_height FROM \"$BLOCKS_TABLE\" ORDER BY block_height DESC LIMIT 1;" $POSTGRES_DB)
DEPLOY_HEIGHT=$((BLOCK_HEIGHT + 5))

echo "Current block height is $BLOCK_HEIGHT, new config will be deployed at block height $DEPLOY_HEIGHT"
postchain.sh add-configuration -bc /usr/src/rell/target/blockchains/${CHAIN_ID}/0.xml -h $DEPLOY_HEIGHT -cid ${CHAIN_ID} -nc /usr/src/rell/target/node-config.properties --allow-unknown-signers
