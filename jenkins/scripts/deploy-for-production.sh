#!/usr/bin/env sh

echo 'Updating the product major version, building and packaging'
npm version major
npm run build
npm pack
#stash includes: '*.tgz', name: 'prodbuildresult'
