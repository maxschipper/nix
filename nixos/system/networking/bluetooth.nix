{ pkgs, ... }:
{
  hardware.bluetooth.enable = true;
  environment.systemPackages = [
    pkgs.bluez-tools
    pkgs.bluetuith
  ]; # ++ if desktop/gui     pkgs.blueman
}
