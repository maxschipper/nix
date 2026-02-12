{ config, lib, ... }:
let
  allServices = config.homelab.services;
  enabledServices = lib.filterAttrs (name: svc: svc.enable && svc.dash.enable) allServices;

  monitorContent = lib.mapAttrsToList (name: svc: {
    title = svc.dash.displayName;
    alt-status-codes = svc.dash.statusCodes;
    inherit (svc.dash) url icon;
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
