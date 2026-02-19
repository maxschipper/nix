{ inputs, lib, ... }:
{
  imports = [ ./caches.nix ];
  nix = {
    settings = {
      use-xdg-base-directories = true;
      warn-dirty = false;
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
    };
    channel.enable = false;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    registry =
      inputs
      |> lib.filterAttrs (name: v: v ? outputs && name != "self")
      |> lib.mapAttrs (_: flake: { inherit flake; });
  };
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
}
