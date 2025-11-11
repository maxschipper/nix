{ pkgs, ... }:
{
  imports = [ ./. ];
  services.cage = {
    enable = true;
    user = "max";
    program = "${pkgs.chromium}/bin/chromium --app='https://youtube.com/tv'";
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
