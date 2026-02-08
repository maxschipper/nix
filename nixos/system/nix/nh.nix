{ flakeRepoRoot, ... }:
{
  programs.nh = {
    enable = true;
    flake = flakeRepoRoot;
    clean = {
      enable = false;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };
}
