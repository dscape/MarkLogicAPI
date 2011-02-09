#!/bin/sh
curl -s localhost:6984/_cluster/_databases \
  | grep '^{\.*' | wc -l
