{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.matchbox
  ];
  services.xserver.displayManager.startx = {
    enable = false;
    # generateScript = ;
    # extraCommands = ;
  };
}
