{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  # required for screen sharing
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
  };
  # force some apps to use wayland
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
    wl-clipboard

    upower # TODO: move
    upower-notify # TODO: move

    hyprdim
    hyprcursor
    hyprkeys
    hypridle
    hyprlock
    hyprpaper
    hyprshot
    hyprsunset
    hyprsysteminfo
    hyprpicker

    waybar # TODO: remove
    wofi # TODO: remove
    walker
    swaynotificationcenter # TODO: remove
    libnotify

    nautilus
    nautilus-open-any-terminal
    gnome-disk-utility
    gnome-calendar
    gnome-font-viewer
  ];
}
