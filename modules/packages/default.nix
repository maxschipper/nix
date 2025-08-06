# ./packages.nix
{
  config,
  pkgs,
  lib,
  ...
}:

{
  config = {

    fonts.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
    ];

    programs = {

      nh = {
        enable = true;
        flake = "/home/max/nix/";
      };

      fish = {
        enable = true;
        useBabelfish = true;
        interactiveShellInit = ''
          set -gx NIX_PATH "nixpkgs=flake:nixpkgs"
        '';
      };

      zoxide = {
        enable = true;
        enableFishIntegration = true;
      };

      bat = {
        enable = true;
        extraPackages = with pkgs.bat-extras; [ batman ];
      };
    };

    users.users.max.shell = pkgs.fish;

    environment.systemPackages = with pkgs; [
      helix
      zellij
      starship
      ghostty
      gh
      difftastic
      gh
      just
      stow
      fastfetch
      lsd
      wget
      nixd
      nil
      nixfmt-rfc-style
      nfd
      yazi
      lazygit
      git
      tldr
      ntfs3g
      fzf
      ripgrep
      fd
      btop
      powertop
      ncdu
      baobab
      gemini-cli
    ];
  };
}
