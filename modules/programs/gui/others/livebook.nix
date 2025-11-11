{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    livebook
  ];
}
