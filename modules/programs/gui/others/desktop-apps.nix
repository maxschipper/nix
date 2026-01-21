{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.kdePackages.dolphin
    pkgs.nautilus
    pkgs.gnome-disk-utility
    pkgs.gnome-font-viewer
    pkgs.cheese
    pkgs.snapshot
    pkgs.zathura
    pkgs.dragon-drop
    pkgs.mpv
    pkgs.imv
  ];
}
