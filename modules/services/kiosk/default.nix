{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # matchbox
    surf
    unclutter-xfixes
  ];
}
