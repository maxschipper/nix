{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.freecad-wayland
  ];
}
