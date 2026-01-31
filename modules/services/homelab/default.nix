# {  pkgs, ... }:
{
  imports = [
    ./options.nix
  ];

  homelab = {
    domain = "nuc.lab";
    ips = [
      "10.0.0.2" # lan
      # "100.96.128.41" # tailscale
      "100.64.0.230" # netbird
    ];

    services = {

      glance = {
        enable = true;
        port = 5678;
        subdomain = "dash";
        dash.enable = false;
      };

      gitea = {
        enable = true;
        port = 3000;
      };

      paperless = {
        enable = true;
        port = 28981;
        dash.icon = "sh:paperless-ngx";
      };

      adguard = {
        enable = true;
        port = 3001;
        dash = {
          displayName = "AdGuard Home";
          icon = "sh:adguard-home";
        };
      };

      webdav = {
        enable = true;
        port = 2345;
        dash = {
          displayName = "WebDAV";
          icon = "sh:filesync";
          statusCodes = [
            207
            401
          ];
        };
      };

      immich = {
        enable = true;
        port = 2283;
      };

      hass = {
        enable = true;
        port = 8123;
        dash = {
          displayName = "Home Assistant";
          icon = "sh:home-assistant";
        };
      };

      navidrome = {
        enable = true;
        port = 4533;
      };

      grafana = {
        enable = true;
        port = 3002;
      };

      prometheus = {
        enable = true;
        port = 9090;
      };

      node-exporter = {
        enable = true;
        port = 9100;
        dash.enable = false;
      };

      smart-exporter = {
        enable = false;
        port = 9633;
        dash.enable = false;
      };

      lidarr = {
        enable = false;
        port = 8686;
      };

      deemix = {
        enable = true;
        port = 6595;
        dash.icon = "https://cdn.jsdelivr.net/gh/selfhst/icons/webp/deemix.webp";
      };

      glances = {
        enable = true;
        port = 61208; # hardcoded in the service
      };

    };
  };
}
