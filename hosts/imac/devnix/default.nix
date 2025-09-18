{
  imports = [
    ./configuration.nix
    ./../common-configuration.nix
    ./../hardware-configuration.nix
    ../../../modules/sessions/wm/cage.nix
    ../../../modules/programs/gui/browser/chromium.nix
  ];
}
