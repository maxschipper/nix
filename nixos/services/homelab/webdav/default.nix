{ config, lib, ... }:
let
  cfg = config.homelab.services.webdav;
in
{
  config = lib.mkIf cfg.enable {

    services.webdav = {
      inherit (cfg) enable;
      settings = {
        inherit (cfg) port;
        address = cfg.ip;
        prefix = "/";
        permissions = "CRUD";
        directory = "/var/lib/webdav/default";
        debug = true;
        cors = {
          enabled = true;
          credentials = true;
          allowed_headers = [ "*" ];
          allowed_hosts = [ "*" ];
          allowed_methods = [
            "GET"
            "HEAD"
            "POST"
            "PUT"
            "DELETE"
            "OPTIONS"
            "PROPFIND"
            "PROPPATCH"
            "MKCOL"
            "COPY"
            "MOVE"
            "LOCK"
            "UNLOCK"
          ];
          exposed_headers = [ "*" ];
        };
        users = [
          {
            username = "super-productivity";
            password = "superprod";
            directory = "/var/lib/webdav/superprod";
          }
        ];
      };
    };

    systemd.tmpfiles.rules = [
      "d /var/lib/webdav/default 0750 webdav webdav"
      "d /var/lib/webdav/superprod 0750 webdav webdav"
      "d /var/lib/webdav/superprod/super-productivity 0750 webdav webdav"
    ];

  };
}
