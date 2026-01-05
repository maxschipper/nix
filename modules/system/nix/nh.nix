{ flakeRoot, ... }:
{
  programs.nh = {
    enable = true;
    flake = toString flakeRoot;
    clean = {
      enable = false;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };
}
