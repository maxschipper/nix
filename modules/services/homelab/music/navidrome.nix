{ config, ... }:
let
  cfg = config.homelab.services.navidrome;
in
{
  services.navidrome = {
    enable = cfg.enable;
    settings = {
      Port = cfg.port;
      Address = cfg.ip;
      MusicFolder = "/home/max/Music";
      DataFolder = "/var/lib/navidrome";
      CacheFolder = "/var/cache/navidrome";
    };
  };
}
