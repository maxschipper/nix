let
  cfg = {
    enable = true;
    port = 9100;
    # ip = "100.64.0.161";
    ip = "0.0.0.0";
    interface = "nb";
  };
in
{

  # not needed?
  # networking.firewall.interfaces."{cfg.interface}".allowedTCPPorts = [ cfg.port ];

  services.prometheus.exporters.node = {
    enable = cfg.enable;
    port = cfg.port;
    listenAddress = cfg.ip;
    enabledCollectors = [ "systemd" ];
  };

  # or just bind to 0.0.0.0 ?
  # systemd.services."prometheus-node-exporter".serviceConfig = {
  #   RestartSec = "5m";
  #   StartLimitIntervalSec = 0;
  # };
}
