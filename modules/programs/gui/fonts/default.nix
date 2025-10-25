{ pkgs, ... }:
{
  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.noto-fonts
    pkgs.inter

    # pkgs.jetbrains-mono
    # pkgs.material-design-icons
    # pkgs.material-icons
    # pkgs.material-symbols
  ];
}
