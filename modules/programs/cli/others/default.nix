{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jujutsu
    stow
    fastfetch
    lazygit
    starship
    difftastic
    just
    powertop
    ncdu

    gemini-cli

    fontpreview
    jq
    ffmpeg-headless

    icloudpd
  ];
}
