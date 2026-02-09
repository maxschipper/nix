{ pkgs, ... }:
{
  home-manager.users.max.services.swayidle = {
    enable = true;
    systemdTarget = "graphical-session.target";

    events = {
      before-sleep = "${pkgs.systemd}/bin/loginctl lock-session";
      lock = "${pkgs.procps}/bin/pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock --grace 5";
    };

    timeouts = [
      # 2m: Dim screen
      {
        timeout = 120;
        command = "${pkgs.brightnessctl}/bin/brightnessctl -s && ${pkgs.brightnessctl}/bin/brightnessctl set 1";
        resumeCommand = "${pkgs.brightnessctl}/bin/brightnessctl -r";
      }
      # 3m: Notify before lock
      {
        timeout = 180;
        command = "${pkgs.libnotify}/bin/notify-send -e -t 20000 'Locking screen in 20 seconds!'";
        resumeCommand = "${pkgs.swaynotificationcenter}/bin/swaync-client --hide-latest";
      }
      # 3m 20s: Lock session
      {
        timeout = 200;
        command = "${pkgs.systemd}/bin/loginctl lock-session";
      }
      # 3m 30s: Turn off monitors
      {
        timeout = 210;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
        resumeCommand = "${pkgs.niri}/bin/niri msg action power-on-monitors";
      }
    ];
  };
}
