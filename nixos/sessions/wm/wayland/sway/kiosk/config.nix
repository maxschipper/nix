{ pkgs, lib, ... }:
let
  yt-cmd = import ./yt-cmd.nix;
in
{
  environment.systemPackages = with pkgs; [ ungoogled-chromium ];

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
          command = yt-cmd;
          always = true;
        }
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
