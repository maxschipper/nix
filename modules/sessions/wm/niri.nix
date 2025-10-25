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

  programs.gamemode.enable = true;

  environment.systemPackages = [
    pkgs.capitaine-cursors

    pkgs.wl-clipboard
    pkgs.libnotify
    pkgs.udiskie # for automounting usbs
    pkgs.nwg-displays
    pkgs.nwg-look

    pkgs.blueman

    pkgs.papirus-icon-theme

    pkgs.xwayland-satellite
    pkgs.gnome-keyring
    pkgs.fuzzel
    pkgs.bemoji
    pkgs.swww
    pkgs.libqalculate

    pkgs.waybar
    pkgs.swaynotificationcenter
    pkgs.hypridle
    pkgs.hyprlock
    pkgs.hyprpicker
    pkgs.swayosd
    pkgs.sunsetr
    pkgs.better-control

    pkgs.nirius

  ];
}
