#!/usr/bin/env sh

echo 'Running certifiers on code'
set -x
sleep 1
echo $! > .pidfile
set +x