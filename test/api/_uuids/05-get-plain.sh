#!/bin/sh
curl -sH "Accept: text/plain" localhost:6984/_uuids | wc -wm
