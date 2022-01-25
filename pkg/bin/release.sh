#!/bin/sh
set -e

cd ~/app/cxs/source

nix develop --command './pkg/bin/build.sh'

doas nixos-rebuild switch --impure
