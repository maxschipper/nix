{ pkgs, ... }:
{
  imports = [
    ../.common-wayland.nix
  ];

  programs.hyprland.enable = true;

  security.polkit.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  # required for screen sharing
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = [
    pkgs.wl-clipboard
    pkgs.libnotify
    pkgs.udiskie # for automounting usbs
    pkgs.nwg-displays
    pkgs.nwg-look

    pkgs.hyprls
    pkgs.hyprpolkitagent
    pkgs.hyprland-qt-support

    pkgs.hyprdim
    pkgs.hyprcursor
    pkgs.hypridle
    pkgs.hyprlock
    pkgs.hyprshot
    pkgs.satty
    pkgs.hyprsunset
    pkgs.hyprsysteminfo
    pkgs.hyprpicker
    pkgs.walker
    pkgs.swayosd

    pkgs.upower # TODO: move
    pkgs.upower-notify # TODO: move
  ];
}
