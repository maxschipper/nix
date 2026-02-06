{ config, lib, ... }:
let
  cfg = config.homelab.services.paperless;
in
{
  config = lib.mkIf cfg.enable {

    services.paperless = {
      enable = cfg.enable;
      address = cfg.ip;
      port = cfg.port;
      dataDir = "/var/lib/paperless"; # default
      consumptionDirIsPublic = true;
      settings = {
        PAPERLESS_URL = cfg.url;
        PAPERLESS_CONSUMER_IGNORE_PATTERN = ".DS_STORE";
        PAPERLESS_OCR_LANGUAGE = "deu+eng";
        # PAPERLESS_OCR_USER_ARGS = "";
      };
    };

  };
}
