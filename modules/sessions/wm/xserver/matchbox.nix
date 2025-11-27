{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.matchbox
    pkgs.unclutter-xfixes
    pkgs.kitty
  ];
}
