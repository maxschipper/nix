{
  services.openssh = {
    settings = {
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = true;
    };
  };

  programs.ssh = {
    startAgent = true;
    agentTimeout = "12h";
    extraConfig = ''
      AddKeysToAgent yes
    '';
  };
}
