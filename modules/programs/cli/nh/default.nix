{
  programs.nh = {
    enable = true;
    flake = "/home/max/nix/";
    clean = {
      enable = false;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };
}
