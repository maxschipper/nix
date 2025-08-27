{
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = true;

  services.upower.enable = true;
  services.upower.criticalPowerAction = "Hibernate";

  services.logind.settings.Login.HandlePowerKey = "ignore";
  services.logind.settings.Login.HandleLidSwitch = "hibernate";
  # systemd.sleep.extraConfig = "HibernateDelaySec=1h";
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=yes
    AllowHybridSleep=yes
    AllowSuspendThenHibernate=no
  '';

  # services.auto-cpufreq.enable = true;
  # services.auto-cpufreq.settings = {
  #   battery = {
  #     governor = "powersave";
  #     turbo = "auto";
  #   };
  #   charger = {
  #     governor = "performance";
  #     turbo = "auto";
  #   };
  # };
}
