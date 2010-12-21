#!/bin/sh
curl -sH "Accept: application/xml" localhost:6984/_uuids | wc -wm
