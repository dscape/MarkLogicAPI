#!/bin/sh
curl -s localhost:6984/_all_forests \
 | ruby -e "puts eval(STDIN.read).member?('Documents')"