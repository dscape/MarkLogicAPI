#!/bin/sh
curl -s localhost:6984/_uuids?count=10 | wc -wm