{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.matchbox
    pkgs.unclutter-xfixes
  ];

  # services.xserver.displayManager.startx = {
  #   enable = false;
  # generateScript = ;
  # extraCommands = ;
  # };
}
