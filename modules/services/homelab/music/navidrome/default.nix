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
      MusicFolder = "/var/lib/music";
      DataFolder = "/var/lib/navidrome";
      CacheFolder = "/var/cache/navidrome";
      Prometheus.Enabled = true;
      Scanner.WatcherWait = "30s";
    };
  };
}
