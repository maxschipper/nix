{ pkgs, ... }:

{
  imports = [
    ./.common-wayland.nix
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
    pkgs.hyprls
    pkgs.hyprpolkitagent
    pkgs.hyprland-qt-support
    pkgs.wl-clipboard

    pkgs.hyprdim
    pkgs.hyprcursor
    pkgs.hyprkeys
    pkgs.hypridle
    pkgs.hyprlock
    pkgs.hyprpaper
    pkgs.hyprshot
    pkgs.satty
    pkgs.hyprsunset
    pkgs.hyprsysteminfo
    pkgs.hyprpicker
    pkgs.walker
    pkgs.swayosd

    pkgs.libnotify
    # pkgs.swayimg
    pkgs.udiskie # for automounting usbs

    pkgs.nwg-displays
    pkgs.nwg-look
    pkgs.upower # TODO: move
    pkgs.upower-notify # TODO: move
  ];
}
