{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
  };
  services.libinput.enable = true;
  environment.systemPackages = [
    pkgs.xorg.xorgserver
    pkgs.xorg.xinit
  ];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  # Configure keymap in X11
  # services.xserver.xkb.layout = "de";
  # services.xserver.xkb.options = "caps:escape";
}
