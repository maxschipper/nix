{
  config,
  lib,
  pkgs,
  ...
}:
let
  call = import-path: import import-path { inherit config lib pkgs; };

  bookmarks = call ../widgets/bookmarks.nix;
  calendar = call ../widgets/calendar.nix;
  # clock = call ../widgets/clock.nix;
  dns-stats = call ../widgets/dns-stats.nix;
  markets = call ../widgets/markets.nix;
  monitor = call ../widgets/monitor.nix;
  news = call ../widgets/news.nix;
  releases = call ../widgets/releases.nix;
  search = call ../widgets/search.nix;
  server-stats = call ../widgets/server-stats.nix;
  # todo = call ../widgets/todo.nix;
  weather = call ../widgets/weather.nix;
  netbird = call ../widgets/custom/netbird-devices.nix;
in
{
  name = "Homepage";
  hide-desktop-navigation = true;
  head-widgets = [
    # markets
    search
  ];
  columns = [
    {
      # LEFT COLUMN
      size = "small";
      widgets = [
        server-stats
        netbird
        dns-stats
        releases
      ];
    }
    {
      # CENTER COLUMN
      size = "full";
      widgets = [
        # search
        bookmarks
        monitor
        news
      ];
    }
    {
      # RIGHT COLUMN
      size = "small";
      widgets = [
        # clock
        markets
        weather

        # todo
        calendar
        # bookmarks
      ];
    }
  ];
}
