{ pkgs, ... }:
{
  environment.systemPackages = [
    # pkgs.catppuccin-cursors.mochaMauve
    # pkgs.catppuccin-cursors.mochaDark
    # pkgs.catppuccin-cursors.mochaMaroon
    pkgs.rose-pine-hyprcursor
  ];
}
