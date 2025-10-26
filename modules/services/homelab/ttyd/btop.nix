{ lib, pkgs, ... }:
{
  imports = [ ./common.nix ];
  services.ttyd = {
    entrypoint = [ (lib.getExe pkgs.btop) ];
    user = "max";
  };

}
