{ lib, config, ... }:
let
  mkOpt = type: default: lib.mkOption { inherit type default; };
in
{
  options.homelab = lib.mkOption {
    default = { };
    description = "The Central Service Registry";
    type = lib.types.submodule {
      options = {

        domain = mkOpt lib.types.str "";
        ips = mkOpt (lib.types.listOf lib.types.str) [ ];

        services = lib.mkOption {
          default = { };
          type = lib.types.attrsOf (
            lib.types.submodule (
              { name, ... }:
              {
                options = {

                  enable = lib.mkEnableOption "this service";

                  basedomain = lib.mkOption {
                    types = lib.types.str;
                    default = config.homelab.domain;
                    readOnly = true;
                    description = "The globla base domain (inherited)";
                  };

                  port = mkOpt lib.types.port 0;
                  subdomain = mkOpt lib.types.str name;
                  ip = mkOpt lib.types.str "127.0.0.1";

                  proxy = lib.mkOption {
                    default = { };
                    type = lib.types.submodule {
                      options = {

                        enable = mkOpt lib.types.bool true;
                        type = mkOpt (lib.types.enum [
                          "http"
                          "https"
                          "websocket"
                          "auth"
                        ]) "https";

                      };
                    };
                  };

                  monitor = lib.mkOption {
                    default = { };
                    type = lib.types.submodule {
                      options = {

                        enable = mkOpt lib.types.bool true;
                        icon = mkOpt lib.types.str "sh:${name}";
                        category = mkOpt lib.types.str "General";
                        url = mkOpt lib.types.str ""; # Optional override if not using the subdomain

                      };
                    };
                  };

                };
              }
            )
          );
        };
      };
    };
  };
}
