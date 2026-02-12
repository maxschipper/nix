{ config, ... }:
let
  cfg = config.homelab.services.adguard;
in
{
  type = "dns-stats";
  cache = "30s";
  service = "adguard";
  inherit (cfg) url;
  username = "max";
  password = "";
  hour-format = "24h";
  hide-graph = false;
  hide-top-domains = false;
}
