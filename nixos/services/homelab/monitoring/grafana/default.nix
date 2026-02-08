{ config, lib, ... }:
let
  cfg = config.homelab.services.grafana;
  cfgPrometheus = config.homelab.services.prometheus;
in
{
  config = lib.mkIf cfg.enable {

    services.grafana = {
      enable = cfg.enable;
      dataDir = "/var/lib/grafana";
      settings = {
        server = {
          http_port = cfg.port;
          http_addr = cfg.ip;
          root_url = cfg.url;
          enable_gzip = true;
        };
        database = {
          wal = true;
          # type = "sqlite3";
          # path = "/var/lib/grafana/grafana.db";
        };
        analytics = {
          reporting_enabled = false;
          feedback_links_enabled = false;
        };
      };
      provision = {
        enable = true;
        datasources.settings.datasources = [
          {
            name = "Prometheus";
            type = "prometheus";
            access = "proxy";
            editable = true;
            url = "http://${cfgPrometheus.ip}:${toString cfgPrometheus.port}";
          }
          # {
          #   name = "Loki";
          #   type = "loki";
          #   access = "proxy";
          #   url = "http://127.0.0.1:3100";
          # }
        ];
      };
    };
  };
}
