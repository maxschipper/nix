{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.jujutsu
    pkgs.stow
    pkgs.fastfetch
    pkgs.starship
    pkgs.difftastic
    pkgs.just
    pkgs.ncdu

    pkgs.gemini-cli

    pkgs.fontpreview
    pkgs.jq
    pkgs.ffmpeg-headless

    pkgs.icloudpd
  ];
}
