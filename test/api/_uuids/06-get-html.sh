#!/bin/sh
curl -sH "Accept: text/html" localhost:6984/_uuids | wc -wm
