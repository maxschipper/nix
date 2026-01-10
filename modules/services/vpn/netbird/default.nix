{ config, flakeStoreRoot, ... }:
let
  cfgClient = config.services.netbird.clients.default;
in
{
  sops.secrets."netbird-setup-key" = {
    sopsFile = flakeStoreRoot + /secrets/netbird-setup-key;
    format = "binary";
    restartUnits = [ "${cfgClient.service.name}.service" ];
  };

  services.netbird = {

    clients.default = {
      port = 51820;
      openFirewall = true;
      name = "netbird";
      interface = "nb";
      hardened = false;
      logLevel = "warning";

      config = {
        DisableSSHConfig = true;
      };

      login = {
        enable = true;
        setupKeyFile = config.sops.secrets."netbird-setup-key".path;
        systemdDependencies = [ "sops-install-secrets.service" ];
      };
    };
  };
}
