#!/bin/sh
curl -sH "Accept: text/plain" localhost:6984/_all_dbs \
  | ruby -e "puts eval(STDIN.read).member?('Documents')"