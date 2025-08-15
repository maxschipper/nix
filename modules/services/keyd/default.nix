{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.keyd
  ];

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          "leftshift+leftmeta+f23" = "rightcontrol"; # bind copilot key to right control
        };
      };
    };
  };

  users.groups.keyd.members = [ "max" ];
  # Override systemd service options
  systemd.services.keyd.serviceConfig.CapabilityBoundingSet = [
    "CAP_SETGID"
  ];

  # Optional, but makes sure that when you type the make palm rejection work with keyd
  # https://github.com/rvaiya/keyd/issues/723
  environment.etc."libinput/local-overrides.quirks".text = ''
    [Serial Keyboards]
    MatchUdevType=keyboard
    MatchName=keyd virtual keyboard
    AttrKeyboardIntegration=internal
  '';
}
