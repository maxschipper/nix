{ config, ... }:
let
  domain = config.homelab.domain;
  homePageURL = config.homelab.services.glance.url;
  gitServerURL = config.homelab.services.gitea.url;
in
{
  imports = [ ./auto.nix ];
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
  services.caddy = {
    enable = true;
    logFormat = "level ERROR";
    globalConfig = ''
      # debug
      # the root.crt is at /var/lib/caddy/.local/share/caddy/pki/authorities/local/root.crt
      local_certs
      grace_period 5s
      metrics {
        per_host
      }
    '';
    virtualHosts.${homePageURL}.serverAliases = [
      domain
      "www.${domain}"
    ];
    virtualHosts.${gitServerURL}.serverAliases = [ "https://git.${domain}" ];
    virtualHosts."https://fritz.${domain}".extraConfig = "reverse_proxy 10.0.0.1";

    virtualHosts."https://dev.${domain}".extraConfig = "reverse_proxy 100.64.0.161:8080";
  };
}
