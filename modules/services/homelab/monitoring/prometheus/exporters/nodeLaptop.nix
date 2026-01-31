let
  cfg = {
    enable = true;
    port = 9100;
    ip = "100.64.0.161";
    interface = "nb";
  };
in
{

  # networking.firewall.interfaces."{cfg.interface}".allowedTCPPorts = [ cfg.port ];

  services.prometheus.exporters.node = {
    enable = cfg.enable;
    port = cfg.port;
    listenAddress = cfg.ip;
    enabledCollectors = [ "systemd" ];
  };
}
