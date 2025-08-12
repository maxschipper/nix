{ pkgs, ... }:
{
  networking.hostName = "laptop";

  powerManagement.enable = true;
  # powerManagement.powertop.enable = true;

  services.upower.enable = true;
  services.upower.criticalPowerAction = "Hibernate";

  services.fwupd.enable = true;

  services.logind.powerKey = "ignore";
  services.logind.lidSwitch = "hibernate";
  # systemd.sleep.extraConfig = "HibernateDelaySec=1h";
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=yes
    AllowHybridSleep=yes
    AllowSuspendThenHibernate=no
  '';
  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "auto";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };

  boot.initrd.systemd.enable = true;

  boot.resumeDevice = "/dev/mapper/crypted";

  services.fstrim.enable = true;

  hardware.enableRedistributableFirmware = true;

  services.printing.enable = false;

  system.stateVersion = "25.05"; # Did you read the comment? https://nixos.org/nixos/options.html
}
