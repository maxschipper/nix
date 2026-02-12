{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ rippkgs ];
}
