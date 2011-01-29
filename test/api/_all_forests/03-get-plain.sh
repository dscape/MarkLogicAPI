#!/bin/sh
curl -sH "Accept: text/plain" localhost:6984/_all_forests \
  | ruby -e "puts eval(STDIN.read).member?('Documents')"