{
  imports = [
    ./configuration.nix
    ./../common-configuration.nix
    ./../hardware-configuration.nix
    ../../../modules/sessions/wm/cage.nix
    ../../../modules/services/tailscale
    ../../../modules/programs/gui/others/moonlight.nix
  ];
}
