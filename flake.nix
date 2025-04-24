{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.11";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      # inherit (self) outputs;
      # system = "x86_64-linux";
      # lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts
            ./hosts/pc/configuration.nix
            ./modules/packages
            ./modules/packages/gui
            ./modules/tailscale.nix
          ];
        };
        imac-nix = nixpkgs-stable.lib.nixosSystem {
          system = "x86_64-linux";
          pkgs = import nixpkgs-stable {
            system = "x86_64-linux";
          };
          modules = [
            ./hosts
            ./hosts/imac/configuration.nix
            ./modules/packages
            ./modules/packages/gui
            ./modules/tailscale.nix
          ];
        }
      };
    };
}
