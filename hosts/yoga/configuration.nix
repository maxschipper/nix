{
  environment.localBinInPath = true;
  networking.firewall.allowedTCPPorts = [ 8080 ];

  services.fstrim.enable = true;
  services.fwupd.enable = true;
  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "25.05"; # Did you read the comment? https://nixos.org/nixos/options.html
}
