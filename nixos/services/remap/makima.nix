# NOTE: for makima to start keyd needs to be stopped, but can be started again after
{ pkgs, ... }:
let
  tomlFormat = pkgs.formats.toml { };
  cmd-volume-down = "pulsemixer --change-volume -5 --max-volume 100 --get-mute --get-volume | awk 'NR==1{m=$1} NR==2{print $1 (m==1 ? \"!\" : \"\")}' > /tmp/xob.pipe";
  cmd-volume-up = "pulsemixer --change-volume +5 --max-volume 100 --get-mute --get-volume | awk 'NR==1{m=$1} NR==2{print $1 (m==1 ? \"!\" : \"\")}' > /tmp/xob.pipe";
  cmd-volume-mute = "pulsemixer --toggle-mute --get-mute --get-volume | awk 'NR==1{m=$1} NR==2{print $1 (m==1 ? \"!\" : \"\")}' > /tmp/xob.pipe";
in
{
  environment.systemPackages = [
    pkgs.makima
  ];

  security.sudo.extraRules = [
    {
      users = [ "max" ];
      commands = [
        {
          # command = "${pkgs.makima}/bin/makima";
          command = "/run/current-system/sw/bin/makima";
          options = [
            "NOPASSWD"
            "SETENV"
          ];
        }
      ];
    }
  ];

  # h in yt leanback ui is skip back
  # and ü or corrensponding qwerty key is skip forward

  environment.etc."makima/Xbox Wireless Controller.toml".source =
    tomlFormat.generate "makima-xbox_controller-config"
      {
        commands = {
          BTN_NORTH = [ cmd-volume-down ]; # X
          BTN_WEST = [ cmd-volume-up ]; # Y
          BTN_MODE = [
            "DISPLAY=:0 chromium --disable-infobars --user-agent=\"Mozilla/5.0 (PS4; Leanback Shell) Gecko/20100101 Firefox/65.0 LeanbackShell/01.00.01.75 Sony PS4/ (PS4, , no, CH)\" https://youtube.com/tv > ~/makita-chromium.log 2>&1"
          ]; # Xbox button
        };
        remap = {
          BTN_SOUTH = [ "KEY_ENTER" ]; # A
          BTN_EAST = [ "KEY_BACKSPACE" ]; # B
          BTN_TR = [ "BTN_LEFT" ]; # RB
          BTN_TL = [ "KEY_TAB" ]; # LB
          BTN_SELECT = [ "KEY_F11" ]; # back
          BTN_START = [ "KEY_ESC" ]; # start
          BTN_THUMBR = [ "KEY_LEFTCTRL" ]; # RS
          BTN_THUMBL = [ "KEY_LEFTSHIFT" ]; # LS
          # BTN_MODE = ["KEY_ESC"]; #Xbox button
          BTN_DPAD_UP = [ "KEY_UP" ]; # directional pad up
          BTN_DPAD_RIGHT = [ "KEY_RIGHT" ]; # directional pad right
          BTN_DPAD_DOWN = [ "KEY_DOWN" ]; # directional pad down
          BTN_DPAD_LEFT = [ "KEY_LEFT" ]; # directional pad left
        };
        settings = {
          LSTICK = "disabled"; # cursor, scroll, bind or disabled
          RSTICK = "disabled"; # cursor, scroll, bind or disabled
          "16_BIT_AXIS" = "true"; # necessary for Xbox controllers and Switch joycons, use false for other controllers
          GRAB_DEVICE = "true"; # gain exclusivity on the device
        };
      };

  environment.etc."makima/Chromecast Remote.toml".source =
    tomlFormat.generate "makima-chromecast-config"
      {
        commands = {
          KEY_VOLUMEDOWN = [ cmd-volume-down ];
          KEY_VOLUMEUP = [ cmd-volume-up ];
          KEY_MUTE = [ cmd-volume-mute ];
          # KEY_MUTE = ["pactl set-sink-mute 104 toggle"];
        };
        remap = {
          KEY_SELECT = [ "KEY_ENTER" ];
          KEY_BACK = [ "KEY_BACKSPACE" ];
          KEY_HOMEPAGE = [ "KEY_ESC" ];
          # KEY_VOLUMEUP = ["KEY_F3"];
          # KEY_VOLUMEDOWN = ["KEY_F2"];
          # KEY_MUTE = ["KEY_SPACE"];
          KEY_TV = [ "KEY_F11" ];

          # not working?
          KEY_SCREENLOCK = [ "KEY_F11" ];
          KEY_CAMERA_ACCESS_DISABLE = [ "KEY_F11" ];
          KEY_CAMERA_ACCESS_TOGGLE = [ "KEY_F11" ];
        };
        settings = {
          GRAB_DEVICE = "true"; # gain exclusivity on the device
        };
      };

  # couldnt get systemd services to work. works fine when launching manually with `sudo [-b] MAKIMA_CONFIG=/etc/makima makima` # or `sudo -E[b] makima` for quick testing with ~/.config/makima
  systemd.services.makima = {
    enable = false;
    description = "Makima remapping daemon";
    wantedBy = [ "default.target" ];
    environment = {
      # RUST_BACKTRACE = "1";
      MAKIMA_CONFIG = "/etc/makima";
      XDG_SESSION_TYPE = "wayland";
    };
    path = [
      pkgs.bash
      pkgs.coreutils
      pkgs.systemd
    ];
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      RestartSec = 3;
      ExecStart = "${pkgs.makima}/bin/makima";
      # User = "root";
      User = "max";
      Group = "input";
      # SupplementaryGroups = [ "input" ];
    };
  };

  systemd.user.services.makima = {
    enable = false;
    description = "Makima remapping daemon";
    wantedBy = [ "default.target" ];
    environment = {
      # RUST_BACKTRACE = "1";
      # DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/1000/bus";
      MAKIMA_CONFIG = "/etc/makima";
      XDG_SESSION_TYPE = "wayland";
    };
    path = [
      pkgs.bash
      pkgs.systemd
      pkgs.coreutils
    ];
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      RestartSec = 5;
      ExecStart = "${pkgs.makima}/bin/makima";
    };
  };

  # boot.kernelModules = [ "uinput" ];
  # users.users.max.extraGroups = [ "input" ];
  # services.udev.extraRules = ''
  #   # Rule for Makima to gain access to uinput device for creating virtual keyboard
  #   SUBSYSTEM=="misc", KERNEL=="uinput", MODE="0660", GROUP="input", TAG+="uaccess"
  # '';
}
