{
  config,
  flakeRoot,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops.defaultSopsFile = "${flakeRoot}/secrets/secret.yaml";
  sops.age.keyFile = lib.mkIf (
    config.networking.hostName == "yoga"
  ) "/home/max/.config/sops/age/key.txt";
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  sops.age.generateKey = false;
}
