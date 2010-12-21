#!/bin/sh
curl -vs localhost:6984/server/idonotexistyet/1 2>&1 \
 | sed -e 's/^\*.*//' \
 | grep '[<|{].[A-C|E-Z|a-z]'