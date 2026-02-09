{ pkgs, ... }:
{
  # move cache linking to postConfigure (#488420)[https://github.com/NixOS/nixpkgs/pull/488420]
  nixpkgs.overlays = [
    (final: prev: {
      ly = prev.ly.overrideAttrs (oldAttrs: {
        postPatch = "";
        postConfigure = oldAttrs.postPatch;
      });
    })
  ];

  services.displayManager.ly = {
    enable = true;
    settings = {
      clear_password = true;
      session_log = "/home/max/.local/share/ly-session.log";
      asterisk = "0x2022";
      bigclock = "en";
      clock = "null";
      hide_version_string = true;

      # fg = "0x00111111";
      fg = "0x00444444";

      hide_borders = false;
      border_fg = "0x00111111";

      #       none -> Nothing
      #       doom -> PSX DOOM fire
      #     matrix -> CMatrix
      #   colormix -> Color mixing shader
      # gameoflife -> John Conway's Game of Life
      animation = "none";
      animation_timeout_sec = 60;
      cmatrix_fg = "0x80111111";

      # Color mixing animation first color id
      colormix_col1 = "0x80FF0000";
      # Color mixing animation second color id
      colormix_col2 = "0x800000FF";
      # Color mixing animation third color id
      colormix_col3 = "0x20000000";

      brightness_down_cmd = "${pkgs.brightnessctl}/bin/brightnessctl -q s 10%-";
      brightness_up_cmd = "${pkgs.brightnessctl}/bin/brightnessctl -q s +10%";
      # brightness_down_key = F5
      # brightness_up_key = F6
      inactivity_cmd = "shutdown now";
      inactivity_delay = 900; # 15min in seconds

      # broken?
      # auto_login_user = "max";
      # auto_login_session = "niri";

      battery_id = "BAT0";
    };
  };
}
