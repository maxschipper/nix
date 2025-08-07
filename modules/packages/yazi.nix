{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    yazi
    mediainfo
    glow
    hexyl
    rich-cli
  ];

}
