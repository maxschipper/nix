{ config, ... }:
let
  cfg = config.homelab.services.paperless;
in
{
  services.paperless = {
    enable = cfg.enable;
    address = cfg.ip;
    port = cfg.port;
    dataDir = "/var/lib/paperless"; # default
    consumptionDirIsPublic = true;
    settings = {
      PAPERLESS_URL = "https://${cfg.subdomain}.${cfg.basedomain}";
      PAPERLESS_CONSUMER_IGNORE_PATTERN = ".DS_STORE";
      PAPERLESS_OCR_LANGUAGE = "deu+eng";
      # PAPERLESS_OCR_USER_ARGS = "";
    };
  };
}
