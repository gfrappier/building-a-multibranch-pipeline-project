#!/usr/bin/env sh

echo Updating the product patch version, building and packaging
npm version patch
npm run build
npm pack
#stash includes: '*.tgz', name: 'devbuildresult'
