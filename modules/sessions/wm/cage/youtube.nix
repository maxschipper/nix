{ pkgs, ... }:
{
  imports = [ ./. ];
  services.cage = {
    enable = true;
    user = "max";
    program = "${pkgs.chromium}/bin/chromium --kiosk --enable-extensions --user-agent='Mozilla/5.0 (PS4; Leanback Shell) Gecko/20100101 Firefox/65.0 LeanbackShell/01.00.01.75 Sony PS4/ (PS4, , no, CH)' https://youtube.com/tv";
    # program = "${pkgs.chromium}/bin/chromium";
    extraArguments = [
      "-s" # Allow VT switching
      "-d" # Don't draw client side decorations, when possible
      # "-m extend" # Extend the display across all connected outputs (default)
      # "-m last" # Use only the last connected output
    ];
    environment = {
      WLR_LIBINPUT_NO_DEVICES = "1"; # to also run without any input devices
    };
  };

}
