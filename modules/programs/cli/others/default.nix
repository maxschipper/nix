{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.jujutsu
    pkgs.stow
    pkgs.fastfetch
    pkgs.just
    pkgs.ncdu

    pkgs.fontpreview
    pkgs.jq
    pkgs.ffmpeg-headless

    pkgs.icloudpd
  ];

  programs.television = {
    enable = false;
  };
}
