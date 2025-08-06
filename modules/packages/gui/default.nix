# ./packages.nix
{
  config,
  pkgs,
  lib,
  ...
}:
{
  config = {

    programs = {
      firefox.enable = true;
    };

    environment.systemPackages = with pkgs; [
      gparted
      bitwarden
      bitwarden-cli
      bitwarden-desktop
      xournalpp
      gimp
      ungoogled-chromium
    ];
  };
}
