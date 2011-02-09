#!/bin/sh
curl -s localhost:6984/_cluster/_server \
  | grep '^{\.*' | wc -l
