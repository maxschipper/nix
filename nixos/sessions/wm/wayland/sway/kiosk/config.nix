{ pkgs, lib, ... }:
{
  home-manager.users.max.wayland.windowManager.sway = {
    enable = true;
    checkConfig = true;
    wrapperFeatures.gtk = true;
    swaynag.enable = true;
    # xwayland = false;
    # systemd.xdgAutostart = true;
    config = {
      bars = [ ];
      # terminal = null;
      # menu = null;
      focus.followMouse = "no";
      seat."*".hide_cursor = "when-typing enable";
      startup = [
        {
          command = "${lib.getExe pkgs.wl-gammarelay-rs}";
          always = true;
        }
      ];
      # gaps = {
      #   smartBorders = "on";
      # };
    };
  };
}
