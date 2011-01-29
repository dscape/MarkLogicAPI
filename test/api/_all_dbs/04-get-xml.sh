#!/bin/sh
curl -sH "Accept: application/xml" localhost:6984/_all_dbs \
  | grep '>Documents</database>' | wc
