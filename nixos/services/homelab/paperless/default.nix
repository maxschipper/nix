{ config, ... }:
let
  cfg = config.homelab.services.paperless;
in
{
  services.paperless = {
    inherit (cfg) enable port;
    address = cfg.ip;

    dataDir = "/var/lib/paperless"; # default
    consumptionDirIsPublic = true;
    settings = {
      PAPERLESS_URL = cfg.url;
      PAPERLESS_CONSUMER_IGNORE_PATTERN = ".DS_STORE";
      PAPERLESS_OCR_LANGUAGE = "deu+eng";
      # PAPERLESS_OCR_USER_ARGS = "";
    };
  };
}
