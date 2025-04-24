# ./modules/packages/bat.nix
{
  config,
  pkgs,
  lib,
  ...
}:

{
  config = {

      bat = {
        enable = true;
        extraPackages = with pkgs.bat-extras; [ batman ];
      };
  };
};
