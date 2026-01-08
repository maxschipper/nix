{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # nixpkgs-stable.url = "nixpkgs/nixos-25.05";
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
    # niri-flake = {
    #   url = "github:sodiboo/niri-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
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
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations = {
        yoga = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            flakeStoreRoot = self;
          };
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = false;
              allowUnfreePredicate =
                pkg:
                builtins.elem (pkgs.lib.getName pkg) [
                  "hplip"
                  "lmstudio"
                ];
              permittedInsecurePackages = [
                # "libsoup-2.74.3"
              ];
            };
          };
          modules = [
            inputs.nixos-cli.nixosModules.nixos-cli
            inputs.disko.nixosModules.disko
            inputs.nix-index-database.nixosModules.nix-index
            { programs.nix-index-database.comma.enable = true; }

            # inputs.niri-flake.nixosModules.niri
            # {
            #   pkgs.overlays = [ inputs.niri-flake.overlays.niri ];
            #   programs.niri.package = pkgs.niri-unstable;
            # }

            # inputs.mango.nixosModules.mango
            # { programs.mango.enable = true; }
            ./hosts/yoga
          ];
        };
        # ----------------------------------------------------------
        nuc = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            flakeStoreRoot = self;
          };
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = false;
              allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [ ];
              permittedInsecurePackages = [
                # "libsoup-2.74.3"
              ];

            };
          };
          modules = [
            # { _module.args = { inherit pkgs; }; }
            inputs.nixos-cli.nixosModules.nixos-cli
            inputs.nixos-hardware.nixosModules.gmktec-nucbox-g3-plus
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
                builtins.elem (pkgs.lib.getName pkg) [
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
      };
    };
}
