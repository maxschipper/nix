{ config, ... }:
let
  cfg = config.homelab.services.node-exporter;
in
{
  services.prometheus.exporters.node = {
    enable = cfg.enable;
    port = cfg.port;
    listenAddress = cfg.ip;
    enabledCollectors = [ "systemd" ];
  };

}
