#!/usr/bin/env sh
npm version patch
npm run build
npm pack
#stash includes: '*.tgz', name: 'devbuildresult'
