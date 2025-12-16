{ pkgs, ... }:
{
  imports = [
    ./desktop-apps.nix
  ];

  programs.localsend.enable = true;

  environment.systemPackages = [
    pkgs.gparted
    pkgs.xournalpp
    pkgs.gimp
    pkgs.ffmpeg-full
    # pkgs.btrfs-assistant
    # pkgs.handbrake
    pkgs.vscodium-fhs
  ];
}
