{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.jujutsu
    pkgs.stow
    pkgs.fastfetch
    pkgs.starship
    pkgs.just
    pkgs.ncdu

    pkgs.gemini-cli-bin

    pkgs.fontpreview
    pkgs.jq
    pkgs.ffmpeg-headless

    pkgs.icloudpd

    pkgs.vault-tasks
  ];
}
