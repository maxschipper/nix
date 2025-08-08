{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.11";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      # add ?ref=<tag> to track a tag
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      disko,
      quickshell,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        # laptop
        laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = false;
              # allowUnfreePredicate =
              #   pkg:
              #   builtins.elem (nixpkgs.lib.getName pkg) [
              #     # "vivaldi"
              #   ];
            };
          };
          modules = [
            disko.nixosModules.disko
            ./hosts/laptop
            ./modules/packages
            ./modules/packages/gui
            ./modules/tailscale.nix
            ./modules/de/gnome.nix
            ./modules/de/hyprland.nix
            ./modules/de/niri.nix

            ./modules/de/quickshell.nix
          ];
        };
        # gaming pc
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
