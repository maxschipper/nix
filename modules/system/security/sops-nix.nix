{
  flakeStoreRoot,
  inputs,
  pkgs,
  ...
}:
let
  sopsAgeKeyPath = "/var/lib/sops/age/keys.txt";
  sshPrivKeyPath = "/etc/ssh/ssh_host_ed25519_key";
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];
  environment.systemPackages = with pkgs; [ sops ];

  sops = {
    defaultSopsFile = flakeStoreRoot + /secrets/secret.yaml;
    age = {
      sshKeyPaths = [ sshPrivKeyPath ];
      keyFile = sopsAgeKeyPath;
      generateKey = true;
    };
  };

  # to let the sops cli know of these keys (can't be done in .sops.yaml)
  # must run sops with sudo to access these files
  environment.sessionVariables = {
    SOPS_AGE_KEY_FILE = sopsAgeKeyPath;
    SOPS_AGE_SSH_PRIVATE_KEY_FILE = sshPrivKeyPath;
  };
}
