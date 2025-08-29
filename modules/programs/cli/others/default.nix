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
    ncdu

    gemini-cli

    fontpreview
    jq
    ffmpeg-headless

    icloudpd
  ];
}
