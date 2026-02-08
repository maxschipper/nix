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

  # fish enables this by default, but it is super slow when rebuilding
  documentation.man.generateCaches = false; # cache for `man -k` or `apropos`

  environment.systemPackages = with pkgs; [
    fishPlugins.puffer
    fishPlugins.autopair
    fishPlugins.sponge
    fishPlugins.done
  ];
}
