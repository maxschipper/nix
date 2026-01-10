{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-cli = {
      url = "github:nix-community/nixos-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-easyroam = {
      url = "github:einetuer/nix-easyroam";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations =
        let
          args = { inherit inputs flakeRepoRoot flakeStoreRoot; };
          flakeStoreRoot = self;
          flakeRepoRoot = "/home/max/nix";

          allowUnfree = allowedUnfreePkgs: {
            nixpkgs.config = {
              allowUnfree = false;
              allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) allowedUnfreePkgs;
            };
          };
          allowInsecure = allowedInsecurePkgs: {
            nixpkgs.config.permittedInsecurePackages = allowedInsecurePkgs;
          };
        in
        {
          # ----------------------------------------------------------
          yoga = nixpkgs.lib.nixosSystem {
            specialArgs = args;
            modules = [
              (allowUnfree [
                "hplip"
                "lmstudio"
              ])
              (allowInsecure [ ])
              ./hosts/yoga
            ];
          };
          # ----------------------------------------------------------
          nuc = nixpkgs.lib.nixosSystem {
            specialArgs = args;
            modules = [
              (allowUnfree [ ])
              (allowInsecure [ ])
              inputs.nixos-hardware.nixosModules.gmktec-nucbox-g3-plus
              ./hosts/nuc
            ];
          };
          # ----------------------------------------------------------
          imac = nixpkgs.lib.nixosSystem {
            specialArgs = args;
            modules = [
              (allowUnfree [ ])
              (allowInsecure [ ])
              inputs.nixos-hardware.nixosModules.apple-imac-14-2
              ./hosts/imac
            ];
          };
          # ----------------------------------------------------------
          pc = nixpkgs.lib.nixosSystem {
            specialArgs = args;
            modules = [
              (allowUnfree [ ])
              (allowInsecure [ ])
              ./hosts/pc
              ./modules/packages
              ./modules/packages/gui
              ./modules/tailscale.nix
            ];
          };
          # ----------------------------------------------------------
        };
    };
}
