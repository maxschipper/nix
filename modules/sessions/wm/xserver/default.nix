{
  services.xserver = {
    enable = true;
    xkb.layout = "de";
    displayManager.lightdm.enable = false;
    displayManager.startx.enable = true;
  };
}
