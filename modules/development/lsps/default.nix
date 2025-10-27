{ pkgs, ... }:
{
  imports = [
    ./nix.nix
  ];
  environment.systemPackages = [
    # NIX
    pkgs.nixd
    pkgs.nil
    pkgs.nixfmt-rfc-style

    # TOML
    pkgs.taplo
    # pkgs.tombi

    # TYPST
    pkgs.typst
    pkgs.typstyle
    pkgs.tinymist
    # pkgs.typst-live

    # JSON / HTML / CSS / ESLINT
    pkgs.vscode-langservers-extracted

    # HELIX Snippets
    pkgs.simple-completion-language-server

    # FISH
    pkgs.fish-lsp

    # pkgs.typescript-language-server
  ];
}
