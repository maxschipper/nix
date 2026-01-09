{ flakeStoreRoot, ... }:
let
  vars = import (flakeStoreRoot + /modules/vars.nix);
in
{
  programs.nh = {
    enable = true;
    flake = vars.flakeRepoRoot;
    clean = {
      enable = false;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };
}
