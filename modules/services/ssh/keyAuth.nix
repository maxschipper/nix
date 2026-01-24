{ flakeStoreRoot, ... }:
{
  services.openssh = {
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = true;
    };
  };

  services.gnome.gcr-ssh-agent.enable = false;
  programs.ssh = {
    startAgent = true;
    agentTimeout = "12h";
    extraConfig = ''
      AddKeysToAgent yes
    '';
    knownHosts = {
      nuc = {
        extraHostNames = [
          "nuc.lab"
          "git.nuc.lab"
          "100.0.64.230"
          "10.0.0.2"
        ];
        publicKeyFile = flakeStoreRoot + /hosts/nuc/ssh-nuc-host-key.pub;
      };
    };
  };
}
