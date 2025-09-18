{ pkgs, ... }:
{
  environment.systemPackages = [
    # pkgs.matchbox
    pkgs.surf
    pkgs.unclutter-xfixes
  ];
}
