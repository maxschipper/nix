{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ente-auth
  ];
}
