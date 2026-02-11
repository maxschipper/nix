{ lib, ... }:
{
  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = lib.mkForce true;
    "net.ipv6.conf.all.forwarding" = lib.mkForce true;
  };

  networking.nameservers = [
    "9.9.9.9"
    "149.112.112.112"
    "2620:fe::fe"
    "2620:fe::f9"
  ];

  environment.enableAllTerminfo = true;
  environment.localBinInPath = true;

  services.fstrim.enable = true;
  services.fwupd.enable = true;
  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "24.11"; # Did you read the comment? https://nixos.org/nixos/options.html
}
