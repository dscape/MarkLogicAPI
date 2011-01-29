#!/bin/sh
curl -sH "Accept: text/html" localhost:6984/_all_forests \
  | grep '<p>Documents</p>' | wc -l
