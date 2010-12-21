#!/bin/sh
curl -svX PUT localhost:6984/TestShouldFail -d "" 2>&1 \
  | sed -e 's/^\*.*//' \
  | grep '[<|{].[A-C|E-Z|a-z]'