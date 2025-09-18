{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.11";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-cli = {
      url = "github:caelestia-dots/cli";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.caelestia-shell.follows = "caelestia-shell";
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.caelestia-cli.follows = "caelestia-cli";
      # inputs.quickshell.follows = "quickshell";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ignis = {
      url = "github:ignis-sh/ignis";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        yoga = nixpkgs.lib.nixosSystem {
          inherit system;
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = false;
              allowUnfreePredicate =
                pkg:
                builtins.elem (nixpkgs.lib.getName pkg) [
                  "hplip"
                ];
              permittedInsecurePackages = [
                # "libsoup-2.74.3"
              ];

            };
          };
          specialArgs = {
            inherit inputs;
          };
          modules = [
            inputs.disko.nixosModules.disko
            inputs.nix-index-database.nixosModules.nix-index
            { programs.nix-index-database.comma.enable = true; }
            ./hosts/yoga
          ];
        };
        # ----------------------------------------------------------
        pc = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          pkgs = import nixpkgs {
            system = "x86_64-linux";
          };
          modules = [
            ./hosts/pc
            ./modules/packages
            ./modules/packages/gui
            ./modules/tailscale.nix
          ];
        };
        # ----------------------------------------------------------
        # imac dev machine
        devnix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config = {
              allowUnfreePredicate =
                pkg:
                builtins.elem (nixpkgs.lib.getName pkg) [
                  "broadcom-sta"
                ];
            };
          };
          modules = [
            ./hosts/imac/devnix
            ./modules/packages
            ./modules/packages/gui
            ./modules/tailscale.nix
            ./modules/paperless.nix
          ];
        };
        # ----------------------------------------------------------
        # imac prod machine
        prodnix = nixpkgs-stable.lib.nixosSystem {
          system = "x86_64-linux";
          pkgs = import nixpkgs-stable {
            system = "x86_64-linux";
            config = {
              allowUnfreePredicate =
                pkg:
                builtins.elem (nixpkgs-stable.lib.getName pkg) [
                  "broadcom-sta"
                ];
            };
          };
          modules = [
            ./hosts/imac/prodnix
            ./modules/packages
            ./modules/tailscale.nix
            ./modules/paperless.nix
          ];
        };
      };
    };
}
