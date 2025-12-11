{ config, ... }:
let
  cfg = config;
in
{
  services.tailscale = {
    extraSetFlags = [ "--advertise-exit-node" ];
    useRoutingFeatures = if (cfg.networking.hostName == "nuc") then "server" else "client";
  };

  # boot.kernel.sysctl = {
  #   "net.ipv4.ip_forward" = 1;
  #   "net.ipv6.conf.all.forwarding" = 1;
  # };
}
