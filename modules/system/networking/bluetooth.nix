{ pkgs, ... }:
{
  hardware.bluetooth.enable = true;
  environment.systemPackages = [
    pkgs.bluez-tools
  ]; # ++ if desktop/gui     pkgs.blueman
}
