{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.makima
  ];

  environment.etc."makima/Xbox Wireless Controller.toml".text = ''
    [remap]
    BTN_SOUTH = ["KEY_ENTER"]
    BTN_WEST = ["KEY_BACKSPACE"]
    BTN_SELECT = ["KEY_F2"]
    BTN_START = ["KEY_F3" ]
    BTN_MODE = ["KEY_ESC"]
    BTN_DPAD_UP = ["KEY_UP"]
    BTN_DPAD_RIGHT = ["KEY_RIGHT"]
    BTN_DPAD_DOWN = ["KEY_DOWN"]
    BTN_DPAD_LEFT = ["KEY_LEFT"]
    RSTICK_UP = ["KEY_UP"]
    RSTICK_DOWN = ["KEY_DOWN"]

    [settings]
    LSTICK_SENSITIVITY = "6"
    RSTICK_SENSITIVITY = "6"
    LSTICK = "disabled"
    RSTICK = "bind"
    LSTICK_DEADZONE = "5"
    RSTICK_DEADZONE = "10"
    16_BIT_AXIS = "true"
    GRAB_DEVICE = "true"
  '';

  environment.etc."makima/Chromecast Remote.toml".text = ''
    [remap]
    KEY_SELECT = ["KEY_ENTER"]
    KEY_BACK = ["KEY_BACKSPACE"]
    KEY_HOMEPAGE = ["KEY_ESC"]
    KEY_VOLUMEUP = ["KEY_F3"]
    KEY_MUTE = ["KEY_F1"]
    KEY_VOLUMEDOWN = ["KEY_F2"]
    KEY_TV = ["KEY_F10"]

    # not working?
    # KEY_SCREENLOCK = ["KEY_"]
    # KEY_CAMERA_ACCESS_DISABLE = ["KEY_"]
    # KEY_CAMERA_ACCESS_TOGGLE = ["KEY_"]

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
}
