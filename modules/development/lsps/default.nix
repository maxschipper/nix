{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # TOML
    taplo
    # tombi

    # JSON / HTML / CSS / ESLINT
    vscode-langservers-extracted

    yaml-language-server

    # HELIX Snippets
    # simple-completion-language-server

    # FISH
    fish-lsp

    # pkgs.typescript-language-server
  ];
}
