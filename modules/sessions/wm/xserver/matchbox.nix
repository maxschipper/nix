{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # matchbox
    unclutter-xfixes
    xdotool
    kitty
  ];
}
