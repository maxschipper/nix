# {  pkgs, ... }:
{
  imports = [
    ./options.nix
  ];

  homelab = {
    domain = "nuc.lab";
    ips = [
      "10.0.0.2" # lan
      "100.96.128.41" # tailscale
      "100.64.0.230" # netbird
    ];

    services = {

      glance = {
        enable = true;
        port = 5678;
        subdomain = "dash";
      };

      gitea = {
        enable = true;
        port = 3000;
      };

      paperless = {
        enable = true;
        port = 28981;
      };

      adguard = {
        enable = true;
        port = 3001;
        monitor = {
          displayName = "AdGuard Home";
          icon = "sh:adguard-home";
        };
      };

      webdav = {
        enable = true;
        port = 2345;
        monitor.displayName = "WebDAV";
      };

      immich = {
        enable = true;
        port = 2283;
      };

      hass = {
        enable = true;
        port = 8123;
        monitor = {
          displayName = "Home Assistant";
          icon = "sh:home-assistant";
        };
      };

      navidrome = {
        enable = true;
        port = 4533;
      };
    };
  };
}
