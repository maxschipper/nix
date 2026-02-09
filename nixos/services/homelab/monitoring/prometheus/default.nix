{ config, lib, ... }:
let
  cfg = config.homelab.services.prometheus;
in
{
  imports = [ ./scrapeConfigs.nix ];

  config = lib.mkIf cfg.enable {
    services.prometheus = {
      enable = cfg.enable;
      port = cfg.port;
      listenAddress = cfg.ip;
      stateDir = "prometheus2"; # will be under /var/lib/
      rules = [ ];
      globalConfig.scrape_interval = "15s";
      scrapeConfigs = [ ]; # defined in ./scrapeConfigs.nix
    };
  };
}
