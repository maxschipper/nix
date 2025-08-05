
{ config, pkgs, ... }:

{
  imports = [
    ./dm.nix
  ];
  # Enable the GNOME Desktop Environment.
  # services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
}

