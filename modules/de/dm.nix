{ ... }:
{
  services.displayManager.ly.enable = true;
  services.displayManager.ly.settings = {
    clear_password = true;
    session_log = "/home/max/.local/share/ly-session.log";
    asterisk = "0x2022";
    bigclock = "en";
    hide_version_string = true;

    #       none -> Nothing
    #       doom -> PSX DOOM fire
    #     matrix -> CMatrix
    #   colormix -> Color mixing shader
    # gameoflife -> John Conway's Game of Life
    animation = "matrix";
    animation_timeout_sec = 60;
    cmatrix_fg = "0x80111111";

    # Color mixing animation first color id
    colormix_col1 = "0x80FF0000";
    # Color mixing animation second color id
    colormix_col2 = "0x800000FF";
    # Color mixing animation third color id
    colormix_col3 = "0x20000000";

    # Brightness increase command
    # brightness_down_cmd = $PREFIX_DIRECTORY/bin/brightnessctl -q s 10%-

    # Brightness decrease key, or null to disable
    # brightness_down_key = F5

    # Brightness increase command
    # brightness_up_cmd = $PREFIX_DIRECTORY/bin/brightnessctl -q s +10%

    # Brightness increase key, or null to disable
    # brightness_up_key = F6
  };
}
