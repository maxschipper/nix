{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.brightnessctl
    pkgs.networkmanagerapplet
  ];
}
