{ config, lib, ... }:
let
  cfg = config.homelab.services.smart-exporter;
in
{
  config = lib.mkIf cfg.enable {

    services.prometheus.exporters.smartctl = {
      enable = cfg.enable;
      port = cfg.port;
      listenAddress = cfg.ip;
      maxInterval = "60s";
      devices = [ ]; # should auto discover
    };

  };
}
