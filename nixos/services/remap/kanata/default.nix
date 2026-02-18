{ pkgs, flakeRepoRoot, ... }:
let
  package = pkgs.kanata-with-cmd;
in
{
  environment.systemPackages = [ package ];
  services.kanata = {
    enable = true;
    inherit package;
    keyboards.default = {
      config = builtins.readFile ./keyboard-config/kanata.kbd;
      port = null;
      devices = [
        "/dev/input/by-path/platform-i8042-serio-0-event-kbd" # yoga keyboard
      ];
      extraArgs = [
        # "--debug"
        "--cfg"
        "/etc/kanata/kanata.kbd"
        "--no-wait"
      ];
      extraDefCfg = ''
        danger-enable-cmd yes
        log-layer-changes no
        delegate-to-first-layer no
        allow-hardware-repeat false
      '';
    };
  };

  # bind mount the keymap file to allow live reloading without messing with the security hardening of the systemd unit or with the permissions on my home directory
  fileSystems."/etc/kanata" = {
    device = "${flakeRepoRoot}/nixos/services/remap/kanata/keyboard-config";
    options = [
      "bind"
      "ro"
      "x-systemd.requires-mounts-for=/home"
    ];
  };
}
