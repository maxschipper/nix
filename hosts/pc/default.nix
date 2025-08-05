{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./../common.nix
    # ../../modules/de/kde.nix
    ../../modules/de/hyprland.nix
  ];
}
