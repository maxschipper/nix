{ lib, pkgs, ... }:
{
  imports = [
    ./.common-wayland.nix
  ];

  programs.niri.enable = true;

  services.iio-niri.enable = false; # sometimes flips output upside down after resume from hibernation

  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "gnome-polkit-agent";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.Settings" = [ "gnome" ];
      };
      niri = {
        default = lib.mkForce [ "gtk" ];
        # default = lib.mkForce [ "gnome" "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "niri" ];
      };
    };
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

    # pkgs.papirus-icon-theme

    pkgs.polkit_gnome
    pkgs.xwayland-satellite
    pkgs.nautilus
    pkgs.fuzzel
    pkgs.bemoji
    pkgs.swww
    pkgs.libqalculate

    pkgs.walker
    pkgs.waybar
    pkgs.swaynotificationcenter
    pkgs.hypridle
    pkgs.hyprlock
    pkgs.hyprpicker
    pkgs.swayosd
    pkgs.sunsetr
    pkgs.better-control

    pkgs.nirius
    pkgs.zenity # gui for scripts, used by waybar-hotspot

  ];
}
