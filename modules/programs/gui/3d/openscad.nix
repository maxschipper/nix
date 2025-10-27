{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.openscad
    pkgs.openscad-lsp
  ];
}
