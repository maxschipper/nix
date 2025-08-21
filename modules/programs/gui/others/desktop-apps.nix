{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.kdePackages.dolphin
    pkgs.gnome-disk-utility
    pkgs.gnome-calendar
    pkgs.gnome-font-viewer
    pkgs.cheese
    pkgs.snapshot
  ];
}
