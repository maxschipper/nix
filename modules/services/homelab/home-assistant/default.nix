{ pkgs, ... }:
{
  services.home-assistant = {
    enable = true;
    config.http = {
      server_port = 8123;
      use_x_forwarded_for = true;
      trusted_proxies = [
        "127.0.0.1"
        "::1"
      ];
    };
    configWritable = true; # but will be overwritten on rebuild
    # extraArgs = [ "--debug" ];
    # defaultIntegrations = [ # lib.mkForce?
    #   "application_credentials"
    #   "frontend"
    #   "hardware"
    #   "logger"
    #   "network"
    #   "system_health"
    #   "automation"
    #   "person"
    #   "scene"
    #   "script"
    #   "tag"
    #   "zone"
    #   "counter"
    #   "input_boolean"
    #   "input_button"
    #   "input_datetime"
    #   "input_number"
    #   "input_select"
    #   "input_text"
    #   "schedule"
    #   "timer"
    #   "backup"
    # ];
    extraComponents = [
      # "default_config"
      # "analytics"
      "isal"
      "mobile_app"
      "assist_pipeline"
      "conversation"
      "bluetooth"
      "configurator"
      "config"
      # "dhcp"
      "esphome"
      # "my"
      # "shopping_list"
      "wled"
      "homekit"
      "matter"
      "shelly"
    ];
    # REMOVED
    # [R.] python3.13-aiodhcpwatcher      1.2.1
    # [R.] python3.13-aiodiscover         2.7.1
    # [R.] python3.13-async-upnp-client   0.46.0
    # [R.] python3.13-av                  16.0.1
    # [R.] python3.13-cached-ipaddress    1.0.1
    # [R.] python3.13-file-read-backwards 3.2.0
    # [R.] python3.13-go2rtc-client       0.3.0
    # [R.] python3.13-netifaces           0.11.0
    # [R.] python3.13-pyroute2            0.9.5
    # [R.] python3.13-python-didl-lite    1.4.1
    # [R.] python3.13-scapy               2.6.1

    customComponents = with pkgs.home-assistant-custom-components; [
      # prometheus_sensor
      # xiaomi_miot
      smartir
      samsungtv-smart
      dwd
    ];

    config = {
      homeassistant = {
        name = "Nuc";
        unit_system = "metric";
        # time_zone = "CET"; # CET for winter and CEST for summer
        # latitude = "!secret latitude";
        # longitude = "!secret longitude";
        # elevation = "!secret elevation";
      };
      # frontend = {
      #   themes = "!include_dir_merge_named themes";
      # };
    };
  };
}
