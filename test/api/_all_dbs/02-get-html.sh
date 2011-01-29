#!/bin/sh
curl -sH "Accept: text/html" localhost:6984/_all_dbsb \
  | grep '<p>Documents</p>' | wc -l
