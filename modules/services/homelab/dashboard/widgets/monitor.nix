{ config, lib, ... }:
let
  allServices = config.homelab.services;
  enabledServices = lib.filterAttrs (name: svc: svc.enable && svc.monitor.enable) allServices;

  monitor = lib.mapAttrsToList (name: svc: {
    title = svc.monitor.displayName;
    url = svc.monitor.url;
    icon = svc.monitor.icon;
    alt-status-codes = svc.monitor.statusCodes;
    same-tab = true;
    timeout = "1s";
  }) enabledServices;

in
{
  type = "monitor";
  hide-header = true;
  cache = "5s";
  title = "Services";
  # style = "compact";
  sites = monitor;
}
