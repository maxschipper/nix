# ./packages.nix
{
  config,
  pkgs,
  lib,
  ...
}:

{
  # You could define options here if needed, but for just packages,
  # you typically only need the 'config' section.
  # options = {};

  config = {
    # Define the system packages using the 'pkgs' argument

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    programs = {
      firefox.enable = true;

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

      bat = {
        enable = true;
        extraPackages = with pkgs.bat-extras; [ batman ];
      };
    };

    # List packages installed in system profile. To search, run:
    # $ nix search wget
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
      gparted
      ntfs3g
      fzf
      ripgrep
      fd
    ];

    fonts.packages = with pkgs; [
      jetbrains-mono
      nerd-fonts.jetbrains-mono
    ];

    # You could potentially define other related things here too,
    # like environment variables, if it makes sense organizationally.
    # environment.variables = { EDITOR = "vim"; };
  };
}
