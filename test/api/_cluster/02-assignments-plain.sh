#!/bin/sh
curl -sH "Accept: text/plain" localhost:6984/_cluster/_assignments \
  | grep '^{\.*' | wc -l
