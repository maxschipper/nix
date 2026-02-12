{ config, ... }:
let
  cfg = config.homelab.services.glances;
in
{
  services.glances = {
    inherit (cfg) enable;
    # extraArgs = [
    #   "--webserver"
    # ];
  };
}
