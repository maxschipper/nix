{ lib, config, ... }:
let
  rootConfig = config;
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

        domain = mkOpt lib.types.str "example.org";
        ips = mkOpt (lib.types.listOf lib.types.str) [ ];

        services = lib.mkOption {
          default = { };
          type = lib.types.attrsOf (
            lib.types.submodule (
              { name, config, ... }:
              {
                options = {

                  enable = lib.mkEnableOption "this service";

                  subdomain = mkOpt lib.types.str name;
                  url = lib.mkOption {
                    type = lib.types.str;
                    default = "${config.proxy.type}://${config.subdomain}.${rootConfig.homelab.domain}";
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

                  dash = lib.mkOption {
                    default = { };
                    type = lib.types.submodule {
                      options = {

                        enable = mkOpt lib.types.bool true;
                        displayName = mkOpt lib.types.str (capitalize name);
                        icon = mkOpt lib.types.str "sh:${name}";
                        category = mkOpt lib.types.str "General";
                        url = mkOpt lib.types.str config.url; # Optional override if not using the subdomain
                        statusCodes = mkOpt (lib.types.listOf (lib.types.ints.between 100 511)) [ ];
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

  config = {
    # to error early in the eval of the config when there are conflicting ports
    assertions =
      let
        enabledServices = lib.filterAttrs (_: v: v.enable && v.port != 0) config.homelab.services;

        serviceList = lib.mapAttrsToList (name: cfg: {
          inherit name;
          inherit (cfg) port;
        }) enabledServices;

        portMap = lib.foldl' (
          acc: service:
          let
            p = toString service.port;
            existing = acc.${p} or [ ];
          in
          acc // { ${p} = existing ++ [ service.name ]; }
        ) { } serviceList;

        duplicates = lib.filterAttrs (_: names: builtins.length names > 1) portMap;

        msgs = lib.mapAttrsToList (
          port: names: "Duplicate service port ${port} used by: ${lib.concatStringsSep ", " names}"
        ) duplicates;
      in
      map (msg: {
        assertion = false;
        message = msg;
      }) msgs;
  };
}
