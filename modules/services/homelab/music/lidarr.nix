{ config, ... }:
let
  cfg = config.homelab.services.lidarr;
in
{
  services.lidarr = {
    enable = cfg.enable;
    dataDir = "/var/lib/lidarr/.config/Lidarr"; # default
    settings = {
      server = {
        port = cfg.port;
        # urlbase = "localhost";
        # bindaddress = "*";
        # bindaddress = "127.0.0.1";
      };
      auth = {
        method = "External";
        required = "DisabledForLocalAddresses";
      };
    };
  };
}
