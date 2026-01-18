{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.typst
    pkgs.typstyle
    pkgs.tinymist
    # pkgs.typst-live
  ];
}
