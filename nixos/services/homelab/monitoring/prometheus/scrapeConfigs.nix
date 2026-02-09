{ config, lib, ... }:
let
  cfgPrometheus = config.homelab.services.prometheus;
  cfgNode = config.homelab.services.node-exporter;
  cfgSmart = config.homelab.services.smart-exporter;
  cfgNavidrome = config.homelab.services.navidrome;
  cfgNodeLaptop = {
    enable = true;
    ip = "100.64.0.161";
    port = 9100;
  };
  cfgCaddy = {
    enable = true;
    port = 2019;
  };
  cfgAdguard = config.homelab.services.adguard-exporter;
in
{
  services.prometheus = lib.mkIf cfgPrometheus.enable {
    scrapeConfigs =
      lib.optional (cfgNode.enable || cfgNodeLaptop.enable) {
        job_name = "node";
        static_configs =
          (lib.optional cfgNode.enable {
            targets = [ "${cfgNode.ip}:${toString cfgNode.port}" ];
          })
          ++ (lib.optional cfgNodeLaptop.enable {
            targets = [ "${cfgNodeLaptop.ip}:${toString cfgNodeLaptop.port}" ];
          });
      }
      # ++ lib.optional cfgNodeLaptop.enable {
      #   job_name = "nodeLaptop";
      #   static_configs = [ { targets = [ "${cfgNodeLaptop.ip}:${toString cfgNodeLaptop.port}" ]; } ];
      # }
      ++ lib.optional cfgSmart.enable {
        job_name = "smart";
        static_configs = [ { targets = [ "${cfgSmart.ip}:${toString cfgSmart.port}" ]; } ];
      }
      ++ lib.optional cfgNavidrome.enable {
        job_name = "navidrome";
        static_configs = [ { targets = [ "${cfgNavidrome.ip}:${toString cfgNavidrome.port}" ]; } ];
      }
      ++ lib.optional cfgCaddy.enable {
        job_name = "caddy";
        static_configs = [ { targets = [ "localhost:${toString cfgCaddy.port}" ]; } ];
      }
      ++ lib.optional cfgAdguard.enable {
        job_name = "adguard";
        static_configs = [ { targets = [ "localhost:${toString cfgAdguard.port}" ]; } ];
      };
  };
}
