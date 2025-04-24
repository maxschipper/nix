# ./modules/packages/bat.nix
{
  config,
  pkgs,
  lib,
  ...
}:

{
  config = {
      zoxide = {
        enable = true;
        enableFishIntegration = true;
      };
  };
};
