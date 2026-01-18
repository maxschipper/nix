{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vscode-langservers-extracted # JSON / HTML / CSS / ESLINT
    yaml-language-server
    taplo
  ];
}
