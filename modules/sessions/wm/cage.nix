{ pkgs, ... }:
{
  imports = [
    ./.common-wayland.nix
  ];
  environment.systemPackages = [
    pkgs.cage
  ];
  services.cage = {
    enable = true;
    user = "max";
    program = "${pkgs.moonlight-qt}/bin/moonlight";
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
