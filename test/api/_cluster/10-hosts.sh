#!/bin/sh
curl -s localhost:6984/_cluster/_hosts \
  | grep '^{\.*' | wc -l
