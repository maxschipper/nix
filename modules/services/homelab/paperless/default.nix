let
  domain = "nuc.lab";
in
{
  services.paperless = {
    enable = true;
    address = "0.0.0.0";
    port = 28981; # default
    dataDir = "/var/lib/paperless"; # default
    consumptionDirIsPublic = true;
    settings = {
      PAPERLESS_URL = "https://paperless.${domain}";
      PAPERLESS_CONSUMER_IGNORE_PATTERN = ".DS_STORE";
      PAPERLESS_OCR_LANGUAGE = "deu+eng";
      # PAPERLESS_OCR_USER_ARGS = "";
    };
  };
}
