{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.jujutsu
    pkgs.jjui
  ];
}
