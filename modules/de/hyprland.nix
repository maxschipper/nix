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

  # enable the sddm display manager with wayland support
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    wofi
    walker
  ];
}
