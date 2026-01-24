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
  };
}
