{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.brightnessctl
    pkgs.lm_sensors
    pkgs.networkmanagerapplet
  ];
}
