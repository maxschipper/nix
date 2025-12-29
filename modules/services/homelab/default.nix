# {  pkgs, ... }:
{
  imports = [
    ./options.nix
  ];

  homelab = {
    domain = "nuc.lab";
    ips = [
      "10.0.0.2"
      "100.64.0.230"
    ];

    services = {

      glances = {
        enable = true;
        port = 5678;
        proxy.subdomain = "dash";
      };

      gitea = {
        enable = true;
        port = 0;
      };

      paperless = {
        enable = true;
        port = 28981;
      };

      adguard = {
        enable = true;
        port = 3001;
      };

      webdav = {
        enable = true;
        port = 2345;
      };

      immich = {
        enable = true;
        port = 2283;
      };

      hass = {
        enable = true;
        port = 8123;
      };

      navidrome = {
        enable = true;
        port = 4533;
      };
    };
  };
}
