{ pkgs, quickshell, ... }:
{
  environment.systemPackages = [
    quickshell.packages.x86_64-linux.default

    pkgs.material-symbols
  ];

}
