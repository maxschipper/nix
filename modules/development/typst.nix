{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.typst
    pkgs.typstyle
  ];
}
