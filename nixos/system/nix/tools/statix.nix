{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ statix ];
}
