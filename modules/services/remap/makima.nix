{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.makima
  ];

  environment.etc."makima/Xbox Wireless Controller.toml".text = ''
    [commands]
    BTN_NORTH = ["pactl set-sink-volume 104 -10%"] #X
    BTN_WEST = ["pactl set-sink-volume 104 +10%"] #Y

    [remap]
    BTN_SOUTH = ["KEY_ENTER"] #A
    BTN_EAST = ["KEY_BACKSPACE"] #B
    BTN_TR = ["BTN_LEFT"] #RB
    BTN_TL = ["KEY_TAB"] #LB
    BTN_SELECT = ["KEY_F11"] #back
    BTN_START = ["KEY_ESC" ] #start
    BTN_THUMBR = ["KEY_LEFTCTRL"] #RS
    BTN_THUMBL = ["KEY_LEFTSHIFT"] #LS
    BTN_MODE = ["KEY_ESC"] #Xbox button
    BTN_DPAD_UP = ["KEY_UP"] #directional pad up
    BTN_DPAD_RIGHT = ["KEY_RIGHT"] #directional pad right
    BTN_DPAD_DOWN = ["KEY_DOWN"] #directional pad down
    BTN_DPAD_LEFT = ["KEY_LEFT"] #directional pad left

    [settings]
    LSTICK = "disabled" #cursor, scroll, bind or disabled
    RSTICK = "disabled" #cursor, scroll, bind or disabled
    16_BIT_AXIS = "true" #necessary for Xbox controllers and Switch joycons, use false for other controllers
    GRAB_DEVICE = "true" #gain exclusivity on the device
  '';

  # TODO: SPACE for pause
  environment.etc."makima/Chromecast Remote.toml".text = ''
    [commands]
    KEY_VOLUMEDOWN = ["pactl set-sink-volume 104 -10%"] #X
    KEY_VOLUMEUP = ["pactl set-sink-volume 104 +10%"] #Y
    # KEY_MUTE = ["pactl set-sink-mute 104 toggle"]

    [remap]
    KEY_SELECT = ["KEY_ENTER"]
    KEY_BACK = ["KEY_BACKSPACE"]
    KEY_HOMEPAGE = ["KEY_ESC"]
    # KEY_VOLUMEUP = ["KEY_F3"]
    # KEY_VOLUMEDOWN = ["KEY_F2"]
    KEY_MUTE = ["KEY_SPACE"]
    KEY_TV = ["KEY_F11"]

    # not working?
    KEY_SCREENLOCK = ["KEY_F11"]
    KEY_CAMERA_ACCESS_DISABLE = ["KEY_F11"]
    KEY_CAMERA_ACCESS_TOGGLE = ["KEY_F11"]

    [settings]
    GRAB_DEVICE = "true" #gain exclusivity on the device
  '';

  # couldnt get systemd services to work. works fine when launchin manually with `sudo [-b] MAKIMA_CONFIG=/etc/makima makima`
  # or `sudo -E[b] makima` for quick testing with ~/.config/makima

  # systemd.services.makima = {
  #   enable = false;
  #   description = "Makima remapping daemon";
  #   serviceConfig = {
  #     Type = "simple";
  #     Restart = "always";
  #     RestartSec = 3;
  #     # ExecStart = "${pkgs.makima}/bin/makima";
  #     ExecStart = "${pkgs.bash}/bin/bash -lc 'exec ${pkgs.makima}/bin/makima'";
  #     # User = "root";
  #     User = "max";
  #     Group = "input";
  #     # Environment = "MAKIMA_CONFIG=/etc/makima";
  #     # Environment = "PATH=${
  #     #   pkgs.lib.makeBinPath [
  #     #     pkgs.coreutils
  #     #     pkgs.bash
  #     #   ]
  #     # }";
  #     # Path = pkgs.lib.makeBinPath [
  #     #   pkgs.coreutils
  #     #   pkgs.bash
  #     # ]; # coreutils provides 'id' and bash/sh are needed

  #     # To ensure the service can use the 'input' group, you might need to
  #     # add the service's user (root by default, or your specified user)
  #     # to that group, or ensure it has permission to access input devices.
  #     # For a service running as root, this is often sufficient, but for a
  #     # non-root user, you might need:
  #     # SupplementaryGroups = [ "input" ];
  #   };
  #   wantedBy = [ "multi-user.target" ];
  #   # Note: 'default.target' on NixOS usually resolves to 'multi-user.target' or 'graphical.target',
  #   # but 'multi-user.target' is the common, reliable choice for non-GUI services.
  # };

  # systemd.user.services.makima = {
  #   enable = true;
  #   description = "Makima remapping daemon";
  #   wantedBy = [ "default.target" ];
  #   serviceConfig = {
  #     Type = "simple";
  #     Restart = "always";
  #     RestartSec = 5;
  #     ExecStart = "${pkgs.makima}/bin/makima";
  #     User = "max";
  #     Group = "input";
  #   };
  # };

  # [Unit]
  # Description=Makima remapping daemon

  # [Service]
  # Type=simple
  # Restart=always
  # RestartSec=3
  # ExecStart=/usr/bin/makima
  # User=
  # Group=input

  # [Install]
  # WantedBy=default.target
  # services.udev.extraRules = ''
  #   ACTION=="add|change", SUBSYSTEM=="input", ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="9450", TAG-="power-switch"
  # '';
}
