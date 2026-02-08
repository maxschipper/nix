{ config, lib, ... }:
let
  cfg = config.homelab.services.immich;
in
{
  config = lib.mkIf cfg.enable {

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
        server.externalDomain = cfg.url;
      };
    };

    users.users.immich.extraGroups = [
      "video"
      "render"
    ];
  };
}
