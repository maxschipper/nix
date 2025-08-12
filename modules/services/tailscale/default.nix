{ pkgs, ... }:
{
  config = {
    services.tailscale = {
      enable = true;
      openFirewall = true;
    };
    environment.systemPackages = [
      pkgs.tailscale
    ];
  };
}
