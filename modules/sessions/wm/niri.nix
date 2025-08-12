{ pkgs, ... }:

{
  programs.niri.enable = true;

  # Required for screen sharing
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ]; # Niri uses the gnome portal
  };

  environment.systemPackages = with pkgs; [
    wofi
    walker
    waybar
  ];
}
