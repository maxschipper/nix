{ config, lib, ... }:
let
  cfg = config.homelab;

  enabledServices = lib.filterAttrs (name: svc: svc.enable && svc.proxy.enable) cfg.services;

  autoHosts = lib.mapAttrs' (name: svc: {
    name = svc.url;
    value = {
      extraConfig = "reverse_proxy ${svc.ip}:${toString svc.port} ";
    };
  }) enabledServices;
in
{
  services.caddy.virtualHosts = autoHosts;
}
