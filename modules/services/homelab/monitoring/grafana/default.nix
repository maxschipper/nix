{ config, ... }:
let
  cfg = config.homelab.services.grafana;
in
{
  services.grafana = {
    enable = cfg.enable;
    dataDir = "/var/lib/grafana";
    settings = {
      server = {
        http_port = cfg.port;
        http_addr = cfg.ip;
        root_url = cfg.url;
        # enable_gzip = true;
      };
      # database = {
      # wal = true;
      #   type = "sqlite3";
      #   path = "/var/lib/grafana/grafana.db";
      # };
      analytics = {
        reporting_enabled = false;
        feedback_links_enabled = false;
      };
    };
  };
}
