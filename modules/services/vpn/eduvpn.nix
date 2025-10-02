{ pkgs, ... }:
{
  # services.resolved.enable = true; # this is required by eduvpn?
  environment.systemPackages = [
    pkgs.eduvpn-client
    # pkgs.openvpn3
  ];

  # the settings below dont seem to be required
  #
  # networking.firewall.allowedUDPPorts = [
  # 51820
  # ];
  # networking.firewall.allowedTCPPorts = [ 443 ];

  # these settings might be required in the future once
  # https://github.com/NixOS/nixpkgs/issues/424326#issuecomment-3062893416
  # https://github.com/NixOS/nixpkgs/pull/442485#issue-3412011274
  # https://github.com/NixOS/nixpkgs/pull/421042#issue-3186324067
  #
  # programs.openvpn3.enable = true;
  # networking.networkmanager.plugins = [
  # pkgs.networkmanager-openvpn
  # ];
}
