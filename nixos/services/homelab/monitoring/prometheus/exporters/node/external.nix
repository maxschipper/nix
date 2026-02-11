{ lib, ... }:
let
  cfg = {
    enable = true;
    port = 9100;
    ip = "0.0.0.0";
    interface = "nb";
  };
in
{
  config = lib.mkIf cfg.enable {

    # networking.firewall.interfaces."{cfg.interface}".allowedTCPPorts = [ cfg.port ]; # not needed?

    services.prometheus.exporters.node = {
      enable = cfg.enable;
      port = cfg.port;
      listenAddress = cfg.ip;
      enabledCollectors = [ "systemd" ];
    };
  };
}
