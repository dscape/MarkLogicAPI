#!/bin/sh
curl -s localhost:6984/_cluster/_assignments \
  | grep '^{\.*' | wc -l
