let
  bookmarks = import ../widgets/bookmarks.nix;
  calendar = import ../widgets/calendar.nix;
  clock = import ../widgets/clock.nix;
  dns-stats = import ../widgets/dns-stats.nix;
  markets = import ../widgets/markets.nix;
  monitor = import ../widgets/monitor.nix;
  news = import ../widgets/news.nix;
  releases = import ../widgets/releases.nix;
  search = import ../widgets/search.nix;
  server-stats = import ../widgets/server-stats.nix;
  todo = import ../widgets/todo.nix;
  weather = import ../widgets/weather.nix;
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
        todo

        # calendar
        # bookmarks
      ];
    }
  ];
}
