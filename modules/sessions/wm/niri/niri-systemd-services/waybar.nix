{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ waybar ];

  systemd.user.targets.graphical-session.wants = [ "waybar.service" ];
}
