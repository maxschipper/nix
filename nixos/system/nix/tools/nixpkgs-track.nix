{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ nixpkgs-track ];
}
