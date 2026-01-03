{ config, lib, ... }:
let
  cfg = config.homelab.services.hass;
in
{
  config = lib.mkIf cfg.enable {

    networking.firewall.allowedTCPPorts = [ cfg.port ];

    virtualisation = {
      docker = {
        enable = true;
        autoPrune.enable = true;
      };
      oci-containers = {
        backend = "docker";

        containers.homeassistant = lib.mkIf cfg.enable {
          image = "ghcr.io/home-assistant/home-assistant:stable";
          extraOptions = [ "--network=host" ]; # Mandatory for device discovery
          volumes = [
            "/var/lib/home-assistant:/config"
            "/etc/localtime:/etc/localtime:ro"
          ];
          environment.TZ = "Europe/Berlin";
        };
      };
    };

    services.caddy.virtualHosts.${cfg.url}.extraConfig =
      "reverse_proxy ${cfg.ip}:${toString cfg.port} ";

  };
}
