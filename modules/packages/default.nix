# ./packages.nix
{
  config,
  pkgs,
  lib,
  ...
}:

{
  config = {
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    fonts.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
    ];

    programs = {

      nh = {
        enable = true;
        flake = "/home/max/.config/nix/";
      };

      fish = {
        enable = true;
        useBabelfish = true;
      };

      zoxide = {
        enable = true;
        enableFishIntegration = true;
      };

      # bat = {
      #   enable = true;
      #   extraPackages = with pkgs.bat-extras; [ batman ];
      # };
    };

    environment.systemPackages = with pkgs; [
      helix
      zellij
      starship
      ghostty
      git
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
      tldr
      ntfs3g
      fzf
      ripgrep
      fd
    ];
  };
}
