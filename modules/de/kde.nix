{ config, pkgs, ... }:

{

  imports = [
    ./dm.nix
  ];
  # KDE Plasma
  # services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
}
