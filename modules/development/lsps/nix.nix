{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.nixd
    pkgs.nil
    pkgs.nixfmt-rfc-style
  ];
}
