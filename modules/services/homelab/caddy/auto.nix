{ config, lib, ... }:
let
  cfg = config.homelab;

  mkAddress = subdomain: "https://${subdomain}.${cfg.domain}";

  enabledServices = lib.filterAttrs (n: v: v.enable && v.proxy.enable) cfg.services;

  autoHosts = lib.mapAttrs' (name: svc: {
    name = mkAddress svc.proxy.subdomain;
    value = {
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
