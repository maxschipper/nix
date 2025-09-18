{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # speeds up build time. i think this was with fish, check again
  documentation.man.generateCaches = false;

  environment.sessionVariables = {
    EDITOR = "hx";
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.max = {
    isNormalUser = true;
    description = "Max";
    extraGroups = [
      "networkmanager"
      "wheel"
    ]; # may need to add audio group
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
