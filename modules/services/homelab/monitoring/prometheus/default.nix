{ config, lib, ... }:
let
  cfg = config.homelab.services.prometheus;
  cfgNode = config.homelab.services.node-exporter;
  cfgSmart = config.homelab.services.smart-exporter;
  cfgNavidrome = config.homelab.services.navidrome;
in
{
  services.prometheus = {
    enable = cfg.enable;
    port = cfg.port;
    listenAddress = cfg.ip;
    stateDir = "prometheus2"; # will be under /var/lib/
    rules = [ ];
    globalConfig.scrape_interval = "15s";
    scrapeConfigs =
      lib.optional cfgNode.enable {
        job_name = "node";
        static_configs = [ { targets = [ "${cfgNode.ip}:${toString cfgNode.port}" ]; } ];
      }
      ++ lib.optional cfgSmart.enable {
        job_name = "smart";
        static_configs = [ { targets = [ "${cfgSmart.ip}:${toString cfgSmart.port}" ]; } ];
      }
      ++ lib.optional cfgNavidrome.enable {
        job_name = "navidrome";
        static_configs = [ { targets = [ "${cfgNavidrome.ip}:${toString cfgNavidrome.port}" ]; } ];
      };
  };
}
