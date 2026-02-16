{ config, ... }:
let
  cfg = config.homelab.services.prometheus;
in
{
  imports = [ ./scrapeConfigs.nix ];

  services.prometheus = {
    inherit (cfg) enable port;
    listenAddress = cfg.ip;
    stateDir = "prometheus2"; # will be under /var/lib/

    globalConfig.scrape_interval = "15s";
    retentionTime = "90d";
  };
}
