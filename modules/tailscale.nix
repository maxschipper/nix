{ config, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      tailscale
    ];
    services.tailscale = {
      enable = true;
      openFirewall = true;
    };
  };
}
