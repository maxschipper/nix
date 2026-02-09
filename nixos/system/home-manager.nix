{
  inputs,
  flakeStoreRoot,
  flakeRepoRoot,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs flakeStoreRoot flakeRepoRoot; };
    users.max = {
      imports = [ (flakeStoreRoot + /nixos/system/users/max/home.nix) ];
      home.stateVersion = "25.05";
      # home.username = "max";
      # home.homeDirectory = "/home/max";
      programs.home-manager.enable = true;
    };
  };
}
