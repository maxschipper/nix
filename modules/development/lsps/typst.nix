{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.typst-fmt
    pkgs.tinymist
    # pkgs.typst-live
  ];
}
