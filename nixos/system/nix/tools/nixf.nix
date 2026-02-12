{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixf-diagnose
    nixf
  ];
}
