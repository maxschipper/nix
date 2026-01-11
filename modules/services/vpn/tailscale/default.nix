{ config, flakeStoreRoot, ... }:
{
  sops.secrets."tailscale-auth-key" = {
    sopsFile = flakeStoreRoot + /secrets/tailscale-auth-key;
    format = "binary";
    restartUnits = [ "tailscale.service" ];
  };

  services.tailscale = {
    enable = true;
    openFirewall = true;
    disableUpstreamLogging = true;
    # authKeyFile = config.sops.secrets."tailscale-auth-key".path;
    # authKeyParameters.ephemeral = false;
  };
}
