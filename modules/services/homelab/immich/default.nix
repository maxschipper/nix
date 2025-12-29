{ config, ... }:
let
  cfg = config.homelab.services.immich;
in
{
  services.immich = {
    enable = cfg.enable;
    port = cfg.port;
    host = cfg.ip;
    mediaLocation = "/var/lib/immich";
    # accelerationDevices = [ "/dev/dri/renderD128" ];
    accelerationDevices = null;
    # machine-learning = {
    #   enable = true;
    #   # environment = {
    #     # MACHINE_LEARNING_MODEL_TTL = "600";
    #   # };
    # };
    settings = {
      server.externalDomain = "${cfg.proxy.type}://${cfg.subdomain}.${cfg.basedomain}";
    };
  };

  users.users.immich.extraGroups = [
    "video"
    "render"
  ];
}
