{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-easyroam = {
      url = "github:0x5a4/nix-easyroam";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # caelestia-cli = {
    #   url = "github:caelestia-dots/cli";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.caelestia-shell.follows = "caelestia-shell";
    # };
    # caelestia-shell = {
    #   url = "github:caelestia-dots/shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.caelestia-cli.follows = "caelestia-cli";
    #   # inputs.quickshell.follows = "quickshell";
    # };
    # ignis = {
    #   url = "github:ignis-sh/ignis";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # mango = {
    #   url = "github:DreamMaoMao/mango";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
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
                  "posy-cursors"
                  "apple_cursor"
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
            inputs.nix-easyroam.nixosModules.nix-easyroam
            # inputs.mango.nixosModules.mango
            # { programs.mango.enable = true; }
            ./hosts/yoga
          ];
        };
        # ----------------------------------------------------------
        nuc = nixpkgs-stable.lib.nixosSystem {
          inherit system;
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = false;
              allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [ ];
              permittedInsecurePackages = [
                # "libsoup-2.74.3"
              ];

            };
          };
          specialArgs = {
            inherit inputs;
          };
          modules = [
            # inputs.disko.nixosModules.disko
            inputs.nix-index-database.nixosModules.nix-index
            { programs.nix-index-database.comma.enable = true; }
            ./hosts/nuc
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
              permittedInsecurePackages = [
                "broadcom-sta-6.30.223.271-57-6.12.47"
              ];
            };
          };
          modules = [
            ./hosts/imac/devnix
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
