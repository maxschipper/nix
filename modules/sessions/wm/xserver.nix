{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
  };
  services.libinput.enable = true;
  environment.systemPackages = [
    pkgs.xorg.xserver
    pkgs.xorg.xinit
  ];
  # Configure keymap in X11
  # services.xserver.xkb.layout = "de";
  # services.xserver.xkb.options = "caps:escape";
}
