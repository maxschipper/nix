{ config, lib, ... }:
let
  cfg = config.homelab.services.deemix;
in
{
  config = lib.mkIf cfg.enable {

    virtualisation = {
      docker = {
        enable = true;
        autoPrune.enable = true;
      };
      oci-containers = {
        backend = "docker";
        containers = {

          deemix = {
            image = "ghcr.io/bambanah/deemix:latest";
            ports = [ "${cfg.ip}:${cfg.port}:6595" ];
            volumes = [
              "/var/lib/deemix:/config"
              "/var/lib/music:/downloads"
            ];
            environment = {
              PUID = "988";
              PGID = "983";
            };
          };

        };
      };
    };

  };
}
