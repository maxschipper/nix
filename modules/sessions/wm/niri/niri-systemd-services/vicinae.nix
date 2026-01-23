{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ vicinae ];

  systemd.user.targets.graphical-session.wants = [ "vicinae.service" ];
}
