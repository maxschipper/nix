{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./configuration.nix
    ./../common-configuration.nix
    ./../hardware-configuration.nix
    ./../../common.nix
  ];
}
