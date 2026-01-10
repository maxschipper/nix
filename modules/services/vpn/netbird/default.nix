{
  config,
  flakeStoreRoot,
  lib,
  ...
}:
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
    # useRoutingFeatures = "client"; # will be set in different client.nix / server.nix files

    clients.default = {
      port = 51820;
      openFirewall = true;
      name = "netbird";
      interface = "nb";
      hardened = false;
      logLevel = "warning";
      # dns-resolver = {
      #   address = null;
      #   port = 53;
      # };

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

  users.users.max.extraGroups = lib.mkIf cfgClient.hardened [ cfgClient.user.group ];
  # systemd.services.${cfgClient.service.name}.serviceConfig.AmbientCapabilities = [
  #   "CAP_NET_BIND_SERVICE"
  # ];
}
