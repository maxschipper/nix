{ inputs, lib, ... }:
{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];
    channel.enable = false;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    # registry.nixpkgs.flake = inputs.nixpkgs;
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

  };
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
}
