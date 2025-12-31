{ config, ... }:
let
  cfg = config.homelab.services.smart-exporter;
in
{
  services.prometheus.exporters.smartctl = {
    enable = cfg.enable;
    port = cfg.port;
    listenAddress = cfg.ip;
    maxInterval = "60s";
    devices = [ ]; # should auto discover
  };
}
