let
  vars = import ../../vars.nix;
in
{
  # doesnt work i just run the script from hyprland
  systemd.user.services.fixProAudio = {
    description = "Fix Pro Audio profile for AMD HD Audio";
    after = [
      "pipewire.service"
      "wireplumber.service"
    ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${vars.nhFlake}/scripts/fix_audio.sh";
    };
  };
}
