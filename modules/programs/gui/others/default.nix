{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gparted
    xournalpp
    gimp
    mpv
    ffmpeg-full
  ];
}
