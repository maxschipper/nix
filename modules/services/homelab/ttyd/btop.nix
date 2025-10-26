{ lib, pkgs, ... }:
{
  imports = [ ./common.nix ];
  services.ttyd = {
    entrypoint = [ (lib.getExe pkgs.btop) ];
    port = 7682;
    user = "max";
  };

}
