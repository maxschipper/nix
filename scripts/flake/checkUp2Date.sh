#!/usr/bin/env bash
UPSTREAM_TIME=$(curl -s "https://api.github.com/repos/NixOS/nixpkgs/branches/nixos-unstable" | jq -r '.commit.commit.committer.date | fromdate')

DOWNSTREAM_TIME=$(cat $NH_FLAKE/flake.lock | jq '.nodes.nixpkgs.locked.lastModified')

if [ "$DOWNSTREAM_TIME" -lt "$UPSTREAM_TIME" ]; then
  echo "nixpkgs has new commits"
  exit
else
  echo "nixpkgs is up to date"
  exit
fi
