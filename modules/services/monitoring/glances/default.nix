{ config, ... }:
let
  cfg = config.homelab.services.glances;
in
{
  services.glances = {
    enable = cfg.enable;
    # extraArgs = [
    #   "--webserver"
    # ];
  };
}
