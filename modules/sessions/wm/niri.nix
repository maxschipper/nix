{ pkgs, ... }:
{
  imports = [
    ./.common-wayland.nix
  ];

  programs.niri.enable = true;

  # Required for screen sharing
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ]; # Niri uses the gnome portal
  };

  environment.systemPackages = [
    pkgs.wl-clipboard
    pkgs.wofi
    pkgs.walker
    # pkgs.waybar
  ];
}
