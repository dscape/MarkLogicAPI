#!/bin/sh
curl -sH "Accept: text/plain" localhost:6984/_cluster/_databases \
  | grep '^{\.*' | wc -l
