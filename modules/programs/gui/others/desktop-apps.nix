{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.kdePackages.dolphin
    pkgs.nautilus
    pkgs.gnome-disk-utility
    pkgs.gnome-calendar
    pkgs.gnome-font-viewer
    pkgs.cheese
    pkgs.snapshot
    pkgs.zathura
  ];
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "foot-client";
  };
}
