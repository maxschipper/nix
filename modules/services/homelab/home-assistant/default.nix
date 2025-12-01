{
  services.home-assistant = {
    enable = false;
    extraComponents = [
      "analytics"
      "default_config"
      "esphome"
      # "my"
      # "shopping_list"
      # "wled"
      # "homekit"
      # "matter"
      "shelly"
    ];
    # extraArgs = [ "--debug" ];
    configWritable = true; # but will be overwritten on rebuild
    config = {
      # homeassistant = {
      #   name = "Home";
      #   latitude = "!secret latitude";
      #   longitude = "!secret longitude";
      #   elevation = "!secret elevation";
      #   unit_system = "metric";
      #   time_zone = "UTC";
      # };
      # frontend = {
      #   themes = "!include_dir_merge_named themes";
      # };
      # feedreader.urls = [ "https://nixos.org/blogs.xml" ];
      http = {
        server_port = 8123;
        server_host = "0.0.0.0";
      };
    };
  };
}
