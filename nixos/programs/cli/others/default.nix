{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jujutsu
    stow
    fastfetch
    just
    ncdu

    fontpreview
    jq
    ffmpeg-headless

    icloudpd

    bitwarden-cli

    wifitui
  ];

  programs.television = {
    enable = false;
  };
}
