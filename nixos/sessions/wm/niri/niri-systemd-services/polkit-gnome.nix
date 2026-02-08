{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.polkit_gnome ];

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "gnome-polkit-agent";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
