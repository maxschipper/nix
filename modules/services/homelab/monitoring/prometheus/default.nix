{ config, ... }:
let
  cfg = config.homelab.services.prometheus;
  cfgNode = config.homelab.services.node-exporter;
  cfgSmart = config.homelab.services.smart-exporter;
in
{
  services.prometheus = {
    enable = cfg.enable;
    port = cfg.port;
    listenAddress = cfg.ip;
    stateDir = "prometheus2"; # will be under /var/lib/
    rules = [ ];
    globalConfig.scrape_interval = "15s";
    scrapeConfigs = {
      node = {
        jobName = "node";
        staticConfigs = [ { targets = [ "${cfgNode.ip}:${cfgNode.port}" ]; } ];
      };
      smart = {
        jobName = "smart";
        staticConfigs = [ { targets = [ "${cfgSmart.ip}:${cfgSmart.port}" ]; } ];
      };
    };

  };
}
