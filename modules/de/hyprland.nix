{ pkgs, ... }:

{
  imports = [
    ./dm.nix
  ];
  # enable Hyprland
  programs.hyprland.enable = true;

  # required for screen sharing
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    GDK_BACKEND = "wayland,x11";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
  };

  environment.systemPackages = with pkgs; [
    hyprls
    hyprpolkitagent
    hyprland-qt-support
    nwg-displays
    nwg-look

    upower
    upower-notify

    hyprdim
    hyprcursor
    hyprkeys
    hypridle
    hyprlock
    hyprpaper
    hyprshot
    hyprsunset
    hyprsysteminfo
    hyprpicker # colorpicker

    wl-clipboard

    waybar
    wofi
    walker
    swaynotificationcenter
    libnotify

    nautilus
    nautilus-open-any-terminal
    gnome-disk-utility
    gnome-calendar
    gnome-font-viewer
  ];
}
