#!/bin/sh
curl -sH "Accept: application/xml" localhost:6984/_all_forests \
  | grep '>Documents</database>' | wc
