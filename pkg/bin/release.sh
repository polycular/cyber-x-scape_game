#!/bin/sh
set -e

cd ~/app/cxs/source

git pull

nix develop --command './pkg/bin/build.sh'

doas nixos-rebuild switch --impure
