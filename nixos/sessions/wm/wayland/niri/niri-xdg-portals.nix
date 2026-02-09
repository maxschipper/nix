{ lib, pkgs, ... }:
{
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
}
