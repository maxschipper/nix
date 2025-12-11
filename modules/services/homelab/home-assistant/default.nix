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
      "configuration"
      # "dhcp"
      "esphome"
      # "my"
      # "shopping_list"
      "wled"
      "homekit"
      "matter"
      "shelly"
    ];
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
