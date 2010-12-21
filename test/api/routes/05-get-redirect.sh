#!/bin/sh
curl -vs localhost:6984/_download 2>&1 | sed -e 's/^\*.*//' | grep '<'
