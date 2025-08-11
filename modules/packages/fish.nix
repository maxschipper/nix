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

  environment.systemPackages = with pkgs; [
    fish-lsp
    fishPlugins.puffer
    fishPlugins.autopair
  ];

}
