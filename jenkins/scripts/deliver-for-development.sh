#!/usr/bin/env sh
npm version patch
npm run build
npm pack
archiveArtifacts '*.tgz'
#stash includes: '*.tgz', name: 'devbuildresult'
