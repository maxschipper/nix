{ pkgs, ... }:

{
  imports = [
    ./dm.nix
  ];
  # Enable the Niri window manager
  programs.niri.enable = true;

  # Required for screen sharing
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ]; # Niri uses the gnome portal
  };

  # Enable the sddm display manager with wayland support
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;

  # Basic packages for a usable Niri setup
  environment.systemPackages = with pkgs; [
    dmenu # Application launcher
    wofi
    waybar
    # quickshell
  ];
}
