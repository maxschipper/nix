{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.ente-auth
  ];
}
