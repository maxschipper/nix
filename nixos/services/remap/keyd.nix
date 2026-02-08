{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.keyd
  ];

  services.keyd = {
    enable = true;
    keyboards.default = {
      # use command `keyd monitor`
      ids = [
        "*"
        # "0001:0001:09b4e68d" # yoga internal keyboard
        # "17ef:619e:a7a9c955" # lenovo wireless keyboard
        "-045e:0b22:a9ce7264" # id of xbox controller found with keyd monitor
        "-04F3:327E" # yoga touchpad emits numlock and kpminus events; NOT WORKING??
        "-18d1:9450:809e75e5" # chromecast remote
      ];
      settings = {
        main = {
          # capslock = "esc";
          capslock = "overload(shift, esc)";
        };

        # Tapping both shift keys will activate capslock.
        # NOT WORKING
        # shift = {
        #   leftshift = "capslock";
        #   rightshift = "capslock";
        # };
      };
    };

    keyboards.yoga-keyboard = {
      ids = [ "0001:0001:09b4e68d" ];
      settings.main = {
        capslock = "overload(shift, esc)";
        # TODO: create alias for copilot key?
        # "leftshift+leftmeta+f23" = "rightcontrol"; # bind copilot key to right control
        "leftshift+leftmeta+f23" = "rightmeta"; # bind copilot key to right meta
        # swap super and alt
        leftalt = "layer(meta)";
        leftmeta = "layer(alt)";
      };
    };

    # keyboards.lenovo-wireless = {
    #   ids = [ "17ef:619e:a7a9c955" ];
    #   settings.main = {
    #   };
    # };

    # keyboards.chromecast-remote = {
    #   ids = [ "18d1:9450" ];
    #   settings = { };
    # };
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
