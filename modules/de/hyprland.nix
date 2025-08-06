{ pkgs, ... }:

{
  imports = [
    ./dm.nix
  ];
  # enable Hyprland
  programs.hyprland.enable = true;
  programs.hyprland.package = pkgs.hyprland;

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

  # enable the sddm display manager with wayland support
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprls
    hyprpolkitagent
    hyprland-qt-support

    hyprdim
    hyprcursor
    hyprkeys
    hypridle
    hyprlock
    hyprpaper
    hyprshot
    hyprsunset
    hyprsysteminfo

    wl-clipboard

    waybar
    wofi
    walker
    hyprpicker # colorpicker
  ];
}
