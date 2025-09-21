{ pkgs, ... }:
{
  imports = [
    ./.common-wayland.nix
  ];

  programs.niri.enable = true;

  # Required for screen sharing
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = [
    pkgs.wl-clipboard
    pkgs.wofi
    pkgs.walker
    pkgs.xwayland-satellite
    pkgs.wl-clipboard
    pkgs.gnome-keyring
  ];
}
