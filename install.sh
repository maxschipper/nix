#!/usr/bin/env bash
# Exit immediately if a command exits with a non-zero status.
set -e

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root. (e.g. sudo -i)"
  exit 1
fi

echo "INFO: Running disko-install with flakes and nix-command enabled."
echo "INFO: This will wipe the disk and install NixOS."
echo "INFO: Flake target: .#laptop"

# The script is expected to be run from the root of the cloned repository.
nix --extra-experimental-features 'nix-command flakes' run github:nix-community/disko -- --mode disko-install --flake .#laptop

echo "SUCCESS: disko-install finished."
echo "IMPORTANT: Set a password for your user now."
echo "Run: nixos-enter"
echo "Then: passwd <your-username>"
