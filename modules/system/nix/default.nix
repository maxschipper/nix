{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # speeds up build time. i think this was with fish, check again
  documentation.man.generateCaches = false;
}
