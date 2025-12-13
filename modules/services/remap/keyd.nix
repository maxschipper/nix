{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.keyd
  ];

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [
        "*"
        "-045e:0b22:a9ce7264" # id of xbox controller found with keyd monitor
        "-04F3:327E" # yoga touchpad emits numlock and kpminus events; NOT WORKING??
        # "0001:0001:09b4e68d" # yoga internal keyboard
      ];
      settings = {
        main = {
          # capslock = "esc";
          capslock = "overload(shift, esc)";
          # "leftshift+leftmeta+f23" = "rightcontrol"; # bind copilot key to right control
          "leftshift+leftmeta+f23" = "rightmeta"; # bind copilot key to right meta
          # TODO: create alias for copilot key?

          # swap super and alt
          leftalt = "layer(meta)";
          leftmeta = "layer(alt)";
        };

        # Tapping both shift keys will activate capslock.
        # NOT WORKING
        shift = {
          leftshift = "capslock";
          rightshift = "capslock";
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
