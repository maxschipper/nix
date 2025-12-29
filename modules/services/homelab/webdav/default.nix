{ config, ... }:
let
  cfg = config.homelab.services.webdav;
in
{
  services.webdav = {
    enable = cfg.enable;
    settings = {
      address = cfg.ip;
      port = cfg.port;
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
          # directory = "/home/max/nix/modules/services/homelab/todo/super-productivity/data";
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
}
