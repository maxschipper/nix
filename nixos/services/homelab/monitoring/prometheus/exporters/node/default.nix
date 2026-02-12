{ config, ... }:
let
  cfg = config.homelab.services.node-exporter;
in
{
  services.prometheus.exporters.node = {
    inherit (cfg) enable port;
    listenAddress = cfg.ip;

    enabledCollectors = [ "systemd" ];
  };
}
