{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.snapshot
    pkgs.kdePackages.dolphin
    pkgs.gnome-disk-utility
    pkgs.gnome-calendar
    pkgs.gnome-font-viewer
  ];
}
