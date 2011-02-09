#!/bin/sh
curl -sH "Accept: application/xml" localhost:6984/_cluster/_server \
  | grep '</server>' | wc