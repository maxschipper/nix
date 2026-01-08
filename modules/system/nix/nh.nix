let
  vars = import ../../vars.nix;
in
{
  programs.nh = {
    enable = true;
    flake = vars.nixosConfigPath;
    clean = {
      enable = false;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };
}
