{ config, ... }:
let
  domain = config.homelab.domain;
  homePageURL = config.homelab.services.glance.url;
  gitServerUrl = config.homelab.services.gitea.url;
in
{
  imports = [ ./auto.nix ];
  services.caddy = {
    enable = true;
    # logFormat = "level INFO";
    logFormat = "level ERROR";

    # TODO: Reload Caddy instead of restarting it when configuration file changes.
    # If you enable this option, consider setting grace_period to a non-infinite value in services.caddy.globalConfig to prevent Caddy waiting for active connections to finish, which could delay the reload essentially indefinitely.
    globalConfig = ''
      # debug
      # the root.crt is at /var/lib/caddy/.local/share/caddy/pki/authorities/local/root.crt
      local_certs
    '';
    virtualHosts.${homePageURL}.serverAliases = [
      domain
      "www.${domain}"
    ];
    virtualHosts.${gitServerUrl}.serverAliases = [ "https://git.${domain}" ];
    virtualHosts."https://fritz.${domain}".extraConfig = "reverse_proxy 10.0.0.1";
  };
}
