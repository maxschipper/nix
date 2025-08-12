{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.typst
    pkgs.typst-fmt
    pkgs.tinymist
    pkgs.typst-live
  ];
}
