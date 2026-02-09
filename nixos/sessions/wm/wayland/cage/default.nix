{ pkgs, ... }:
{
  imports = [ ../.common-wayland.nix ];

  environment.systemPackages = [ pkgs.cage ];
}
