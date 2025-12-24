{ pkgs, ... }:
{
  environment.systemPackages = [
    # TOML
    pkgs.taplo
    # pkgs.tombi

    # JSON / HTML / CSS / ESLINT
    pkgs.vscode-langservers-extracted

    # HELIX Snippets
    # pkgs.simple-completion-language-server

    # FISH
    pkgs.fish-lsp

    # pkgs.typescript-language-server
  ];
}
