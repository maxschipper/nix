{ pkgs, ... }:

{
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
    wl-clipboard

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
    walker
    swayosd

    libnotify
    swayimg
    udiskie # for automounting usbs

    nwg-displays
    nwg-look
    upower # TODO: move
    upower-notify # TODO: move
  ];
}
