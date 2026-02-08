{ config, lib, ... }:
let
  cfg = config.homelab.services.hass;
  enableMatter = true;
in
{
  config = lib.mkIf cfg.enable {

    networking = {
      enableIPv6 = enableMatter;
      firewall = {
        # Matter Server uses 5580 for the WebSocket API
        allowedTCPPorts = [ cfg.port ] ++ lib.optionals enableMatter [ 5580 ];

        # mDNS (5353) is also required for discovery
        allowedUDPPorts = lib.optional enableMatter 5353;
      };
    };

    virtualisation = {
      docker = {
        enable = true;
        autoPrune.enable = true;
      };
      oci-containers = {
        backend = "docker";

        containers = {

          homeassistant = {
            image = "ghcr.io/home-assistant/home-assistant:stable";
            extraOptions = [ "--network=host" ]; # Mandatory for device discovery
            volumes = [
              "/var/lib/home-assistant:/config"
              "/etc/localtime:/etc/localtime:ro"
            ];
            environment.TZ = "Europe/Berlin";
          };

          matter-server = lib.mkIf enableMatter {
            image = "ghcr.io/home-assistant-libs/python-matter-server:stable";
            # autoStart = true;
            extraOptions = [ "--network=host" ];
            volumes = [
              "/var/lib/matter-server:/data"
            ];
          };

        };
      };
    };

  };
}
