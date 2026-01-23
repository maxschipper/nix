{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    swayidle
    swaylock
  ];

  systemd.user.services.swayidle = {
    description = "swayidle service from nix config";
    # documentation = [ "man:swayidle(1)" ];

    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    # wantedBy = [ "niri.service" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart =
        let
          time = rec {
            dim = 120;
            notifyLock = {
              rel = 20;
              abs = lock - notifyLock.rel;
            };
            lock = 200;
            monitorOff = lock + 10;
          };
          bin = {
            swayidle = "${pkgs.swayidle}/bin/swayidle";
            brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
            notify = "${pkgs.libnotify}/bin/notify-send";
            niri = "${pkgs.niri}/bin/niri";
            hyprlock = "${pkgs.hyprlock}/bin/hyprlock";
            systemctl = "${pkgs.systemd}/bin/systemctl";
            loginctl = "${pkgs.systemd}/bin/loginctl";
            swaync = "${pkgs.swaynotificationcenter}/bin/swaync-client";
            bash = "${pkgs.bash}/bin/bash";
            pidof = "${pkgs.procps}/bin/pidof";
          };
        in
        ''
          ${bin.swayidle} -w \
            timeout ${toString time.dim} '${bin.bash} -c "${bin.brightnessctl} -s && ${bin.brightnessctl} set 1"' resume '${bin.brightnessctl} -r' \
            timeout ${toString (time.notifyLock.abs)} '${bin.notify} -e -t ${toString time.notifyLock.rel}000 "Locking screen in ${toString time.notifyLock.rel} seconds!"' resume '${bin.swaync} --hide-latest' \
            timeout ${toString time.lock} '${bin.loginctl} lock-session' \
            timeout ${toString time.monitorOff} '${bin.niri} msg action power-off-monitors' resume '${bin.niri} msg action power-on-monitors' \
            before-sleep '${bin.loginctl} lock-session' \
            lock '${bin.pidof} ${bin.hyprlock} || ${bin.hyprlock} &'
        '';
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
