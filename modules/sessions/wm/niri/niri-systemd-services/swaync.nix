{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ swaynotificationcenter ];

  systemd.user.targets.graphical-session.wants = [ "swaync.service" ];
}
