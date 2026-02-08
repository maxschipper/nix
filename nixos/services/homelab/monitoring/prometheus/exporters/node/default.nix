{ config, lib, ... }:
let
  cfg = config.homelab.services.node-exporter;
in
{
  config = lib.mkIf cfg.enable {

    services.prometheus.exporters.node = {
      enable = cfg.enable;
      port = cfg.port;
      listenAddress = cfg.ip;
      enabledCollectors = [ "systemd" ];
    };

  };
}
