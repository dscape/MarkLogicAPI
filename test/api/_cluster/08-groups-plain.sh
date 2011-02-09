#!/bin/sh
curl -sH "Accept: text/plain" localhost:6984/_cluster/_groups \
  | grep '^{\.*' | wc -l
