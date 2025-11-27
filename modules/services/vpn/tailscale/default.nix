{ pkgs, ... }:
{
  services.tailscale = {
    enable = true;
    openFirewall = true;
    disableUpstreamLogging = true;
  };
  environment.systemPackages = [
    pkgs.tailscale
  ];
}
