{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];
  environment.systemPackages = with pkgs; [ sops ];

  sops.defaultSopsFile = ../../../secrets/secret.yaml;
  sops.age.keyFile = lib.mkIf (
    config.networking.hostName == "yoga"
  ) "/home/max/.config/sops/age/key.txt";
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  sops.age.generateKey = false;

  sops.secrets.NETBIRD_API_KEY = {
    sopsFile = ../../../secrets/glance.env;
    format = "dotenv";
    reloadUnits = [ "glance.service" ];
  };
}
