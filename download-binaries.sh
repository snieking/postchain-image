#!/usr/bin/env bash

set -ex

PACKAGE=rellr-0.10.4-dist.tar.gz


echo "Downloading ${PACKAGE}"
curl -o ${PACKAGE} -L http://www.chromia.dev/rellr/beta/${PACKAGE}
tar -zxvf ${PACKAGE}
rm ${PACKAGE}