{ pkgs, ... }:
{
  imports = [
    ./desktop-apps.nix
  ];
  environment.systemPackages = with pkgs; [
    gparted
    xournalpp
    gimp
    mpv
    ffmpeg-full
  ];
}
