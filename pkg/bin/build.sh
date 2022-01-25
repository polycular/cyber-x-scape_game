#!/bin/sh
set -e

export MIX_ENV=prod

echo 'get deps...'
MIX_QUIET=true mix deps.get --only $MIX_ENV

echo 'compile app...'
mix compile

echo 'check esbuild...'
mix esbuild.install --if-missing

# hack
echo 'get NPM pkgs...'
npm ci --prefix assets --no-progress --no-fund --no-audit --no-update-notifier --loglevel error

echo 'build local release...'
mix release --quiet
