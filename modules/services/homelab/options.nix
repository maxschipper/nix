{ lib, config, ... }:
let
  mkOpt = type: default: lib.mkOption { inherit type default; };
  capitalize =
    s: if s == "" then "" else (lib.toUpper (builtins.substring 0 1 s)) + (builtins.substring 1 (-1) s);
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
                    type = lib.types.str;
                    default = config.homelab.domain;
                    readOnly = true;
                    description = "The global base domain (inherited)";
                  };

                  subdomain = mkOpt lib.types.str name;
                  url = lib.mkOption {
                    type = lib.types.str;
                    default = "${config.homelab.services.${name}.proxy.type}://${
                      config.homelab.services.${name}.subdomain
                    }.${config.homelab.domain}";
                    readOnly = true;
                    description = "The full url [https://subdomain.domain.tld]";
                  };
                  port = mkOpt lib.types.port 0;
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
                        displayName = mkOpt lib.types.str (capitalize name);
                        icon = mkOpt lib.types.str "sh:${name}";
                        category = mkOpt lib.types.str "General";
                        url = mkOpt lib.types.str config.homelab.services.${name}.subdomain; # Optional override if not using the subdomain

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
