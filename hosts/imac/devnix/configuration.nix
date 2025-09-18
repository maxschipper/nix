{
  networking.hostName = "devnix";

  # networking.firewall = {
  #   # enable = false;
  #   allowedTCPPorts = [ ];
  #   allowedUDPPorts = [ ];
  # };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;
  system.stateVersion = "24.11"; # Did you read the comment?

}
