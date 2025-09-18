{ pkgs, ... }:
{
  fonts.packages = [
    pkgs.jetbrains-mono
    pkgs.nerd-fonts.jetbrains-mono

    pkgs.noto-fonts
  ];

}
