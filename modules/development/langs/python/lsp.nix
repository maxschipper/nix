{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ruff
    ty
    python3Packages.jedi-language-server
    zuban
  ];
}
