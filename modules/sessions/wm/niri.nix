{ pkgs, ... }:
{
  imports = [
    ./.common-wayland.nix
  ];

  programs.niri.enable = true;

  security.polkit.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

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
    pkgs.libnotify
    pkgs.udiskie # for automounting usbs
    pkgs.nwg-displays
    pkgs.nwg-look

    pkgs.xwayland-satellite
    pkgs.gnome-keyring
    pkgs.fuzzel

    pkgs.hypridle
    pkgs.hyprlock
    pkgs.hyprpicker
    pkgs.swayosd

  ];
}
