{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixd
    nil
    nixfmt
    nixfmt-tree
  ];
}
