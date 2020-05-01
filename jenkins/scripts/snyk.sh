#!/usr/bin/env sh

echo 'Running Snyk on code'
set -x
sleep 1
echo $! > .pidfile
set +x