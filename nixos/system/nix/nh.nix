{ flakeRepoRoot, ... }:
{
  programs.nh = {
    enable = true;
    flake = flakeRepoRoot;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 14d";
    };
  };

  environment.sessionVariables = {
    NH_SHOW_ACTIVATION_LOGS = 1;
    NH_NO_CHECKS = 1;
  };
}
