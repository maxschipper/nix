{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ xob ];
}
