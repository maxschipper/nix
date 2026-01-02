{ config, lib, ... }:
let
  cfg = config.homelab;

  enabledServices = lib.filterAttrs (name: svc: svc.enable && svc.proxy.enable) cfg.services;

  autoHosts = lib.mapAttrs' (name: svc: {
    name = svc.url;
    value = {
      listenAddresses = cfg.ips;
      extraConfig = ''
        reverse_proxy ${svc.ip}:${toString svc.port}
      '';
    };
  }) enabledServices;
in
{
  services.caddy.virtualHosts = autoHosts;
  # services.caddy.virtualHosts = {
  #   "hydra.example.com" = {
  #     serverAliases = [ "www.hydra.example.com" ];
  #     extraConfig = ''
  #       encode gzip
  #       root * /srv/http
  #     '';
  #   };
  # };
}
