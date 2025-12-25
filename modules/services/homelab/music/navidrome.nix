{
  services.navidrome = {
    enable = true;
    settings = {
      Port = 4533;
      Address = "127.0.0.1";
      MusicFolder = "/home/max/Music";
      DataFolder = "/var/lib/navidrome";
      CacheFolder = "/var/cache/navidrome";
    };
  };
}
