{ pkgs, ... }:
{
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = true;

  services.upower.enable = true;
  services.upower.criticalPowerAction = "Hibernate";

  # systemd.sleep.extraConfig = "HibernateDelaySec=1h";
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=yes
    AllowHybridSleep=yes
    AllowSuspendThenHibernate=no
  '';

  services.logind.settings.Login.HandleLidSwitch = "hibernate";
  services.logind.settings.Login.HandleLidSwitchExternalPower = "lock";
  services.logind.settings.Login.HandlePowerKey = "ignore";
  services.acpid.enable = true;

  # this normal powerEventCommands triggers twice per press, use handler with "button/power PBTN" event instead
  # services.acpid.powerEventCommands = ''
  #   echo "$(date): Power button pressed" >> /var/log/powerbutton.log
  # '';
  services.acpid.handlers.powerButton = {
    event = "button/power PBTN";
    action = ''
      echo "$(date): Power button pressed to toggle dpms" >> /var/log/powerbutton.log
      sig=$(ls -d /run/user/1000/hypr/* | head -n 1 | xargs basename)
      XDG_RUNTIME_DIR="/run/user/1000" \
      HYPRLAND_INSTANCE_SIGNATURE="$sig" \
      ${pkgs.hyprland}/bin/hyprctl dispatch dpms toggle 2>> /var/log/powerbutton.log
    '';
  };
}
