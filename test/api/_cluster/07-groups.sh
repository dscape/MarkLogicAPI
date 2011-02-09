#!/bin/sh
curl -s localhost:6984/_cluster/_groups \
  | grep '^{\.*' | wc -l
