#!/bin/sh
curl -sv localhost:6984/mapitest 2>&1 \
  | sed -e 's/^\*.*//' \
  | grep '[<|{].[A-C|E-Z|a-z]'