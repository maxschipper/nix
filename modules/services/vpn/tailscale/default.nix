{ pkgs, ... }:
{
  services.tailscale = {
    enable = false;
    openFirewall = true;
    disableUpstreamLogging = true;
  };
  environment.systemPackages = [
    pkgs.tailscale
  ];
}
