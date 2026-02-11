{
  config,
  pkgs,
  lib,
  ...
}:

let
  ydo = lib.getExe pkgs.ydotool;
  wob = "${lib.getExe pkgs.wob} -vv";
  chromium = lib.getExe pkgs.chromium;

  kiosk-launch-script = pkgs.writeShellScriptBin "kiosk-launch" ''
    export XDG_SESSION_TYPE=wayland
    export WLR_NO_HARDWARE_CURSORS=1  # Helps if cursor is invisible/glitchy on some Intel iGPUs
    export YDOTOOL_SOCKET=/run/ydotoold/socket

    # {pkgs.wlr-randr}/bin/wlr-randr --output HDMI-A-1 --mode 1920x1080 --transform 90

    (
      sleep 2
      ${ydo} mousemove -a -- 0 0
    ) &

    # mkfifo /tmp/wobpipe
    tail -f /tmp/wobpipe | ${wob} &


    ${chromium} \
      --user-data-dir="$XDG_DATA_HOME/chromium/yt-leanback" \
      --start-fullscreen \
      --kiosk \
      --no-first-run \
      --enable-features=UseOzonePlatform \
      --ozone-platform=wayland \
      --disable-restore-session-state \
      --ignore-gpu-blocklist \
      --enable-extensions \
      --user-agent="Mozilla/5.0 (Linux; Android 12) Cobalt/22.2.3-gold (PS4)" \
      --app="https://youtube.com/tv"
  '';
in
{
  imports = [ ../.common-wayland.nix ];

  programs.ydotool.enable = true;
  users.users.max.extraGroups = [ config.programs.ydotool.group ];

  services.input-remapper = {
    enable = true;
    enableUdevRules = true;
  };

  services.cage = {
    enable = true;
    user = "max";
    program = "${kiosk-launch-script}/bin/kiosk-launch";
    environment = {
      WLR_LIBINPUT_NO_DEVICES = "1"; # to also run without any input devices
    };
    extraArguments = [
      "-s" # Allow VT switching
      "-d" # Don't draw client side decorations, when possible
      # "-m extend" # Extend the display across all connected outputs (default)
      # "-m last" # Use only the last connected output
    ];
  };
}
