{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.11";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      ...
    }:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          pkgs = import nixpkgs {
            system = "x86_64-linux";
          };
          modules = [
            ./hosts
            ./hosts/pc/configuration.nix
            ./modules/packages
            ./modules/packages/gui
            ./modules/tailscale.nix
          ];
        };
        imac-nix = nixpkgs.lib.nixosSystem {
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
            ./hosts
            ./hosts/imac/configuration.nix
            ./modules/packages
            ./modules/packages/gui
            ./modules/tailscale.nix
          ];
        };
      };
    };
}
