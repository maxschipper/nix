{
  config,
  flakeStoreRoot,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.homelab.services.glance;

  call = import-path: import import-path { inherit config lib pkgs; };

  page-home = call ./pages/home-page.nix;
  # page-all = import ./pages/all.nix;
  # page-test = import ./pages/test.nix;
in
{
  config = lib.mkIf cfg.enable {

    sops.secrets.NETBIRD_API_KEY = {
      sopsFile = flakeStoreRoot + /secrets/glance.env;
      format = "dotenv";
      restartUnits = [ "glance.service" ];
    };

    services.glance = {
      enable = cfg.enable;
      openFirewall = false;
      environmentFile = config.sops.secrets.NETBIRD_API_KEY.path;
      settings = {
        server = {
          host = cfg.ip;
          port = cfg.port;
          proxied = true;
        };
        branding.hide-footer = true;
        pages = [
          page-home
          # page-all
          # page-test
        ];
        theme = {
          # catppuccin mocha
          background-color = "240 21 15";
          contrast-multiplier = 1.2;
          primary-color = "217 92 83";
          positive-color = "115 54 76";
          negative-color = "347 70 65";

          presets = {
            catppuccin_macchiato = {
              background-color = "232 23 18";
              contrast-multiplier = 1.2;
              primary-color = "220 83 75";
              positive-color = "105 48 72";
              negative-color = "351 74 73";
            };
            catppuccin_latte = {
              light = true;
              background-color = "220 23 95";
              contrast-multiplier = 1.0;
              primary-color = "220 91 54";
              positive-color = "109 58 40";
              negative-color = "347 87 44";
            };
            zebra = {
              light = true;
              background-color = "0 0 95";
              primary-color = "0 0 10";
              negative-color = "0 90 50";
            };
            tucan = {
              background-color = "50 1 6";
              primary-color = "24 97 58";
              negative-color = "209 88 54";
            };
          };
        };

      };
    };
  };
}
