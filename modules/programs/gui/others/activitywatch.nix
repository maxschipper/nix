{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.activitywatch
    pkgs.aw-watcher-window-wayland
    pkgs.awatcher
  ];
}
