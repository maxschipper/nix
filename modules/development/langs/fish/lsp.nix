{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fish-lsp
  ];
}
