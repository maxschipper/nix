{ pkgs, ... }:
{
  users.users.max.shell = pkgs.fish;

  programs.fish = {
    enable = true;
    useBabelfish = true;
    interactiveShellInit = ''
      set -gx NIX_PATH "nixpkgs=flake:nixpkgs"
    '';
  };

  environment.systemPackages = [
    pkgs.fishPlugins.tide
    pkgs.fishPlugins.puffer
    pkgs.fishPlugins.autopair
    pkgs.fishPlugins.sponge
    pkgs.fishPlugins.done
  ];

}
