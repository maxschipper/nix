{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ rapidraw ];
}
