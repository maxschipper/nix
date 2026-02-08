{ config, lib, ... }:
let
  cfg = config.homelab.services.caddy;
  myServices = config.homelab.services;

  enabledServices = lib.filterAttrs (name: svc: svc.enable && svc.proxy.enable) myServices;

  autoHosts = lib.mapAttrs' (name: svc: {
    name = svc.url;
    value = {
      extraConfig = "reverse_proxy ${svc.ip}:${toString svc.port} ";
    };
  }) enabledServices;
in
{
  config = lib.mkIf cfg.enable {
    services.caddy.virtualHosts = autoHosts;
  };
}
