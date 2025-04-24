# ./packages.nix
{
  config,
  pkgs,
  lib,
  ...
}:
{
  config = {

    programs = {
      firefox.enable = true;
    };

    environment.systemPackages = with pkgs; [
      gparted
    ];
  };
}
