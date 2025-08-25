{ pkgs, ... }:
{
  imports = [
    ./desktop-apps.nix
  ];

  programs.localsend.enable = true;

  environment.systemPackages = with pkgs; [
    gparted
    xournalpp
    gimp
    mpv
    ffmpeg-full
    btrfs-assistant
  ];
}
