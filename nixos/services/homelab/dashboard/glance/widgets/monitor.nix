{ config, lib, ... }:
let
  allServices = config.homelab.services;
  enabledServices = lib.filterAttrs (name: svc: svc.enable && svc.dash.enable) allServices;

  monitorContent = lib.mapAttrsToList (name: svc: {
    title = svc.dash.displayName;
    url = svc.dash.url;
    icon = svc.dash.icon;
    alt-status-codes = svc.dash.statusCodes;
    same-tab = false;
    timeout = "1s";
  }) enabledServices;

in
{
  type = "monitor";
  hide-header = true;
  cache = "5s";
  title = "Services";
  # style = "compact";
  sites = monitorContent;
}
