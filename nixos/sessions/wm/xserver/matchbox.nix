{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    matchbox
    unclutter-xfixes
    xdotool
    xob
  ];

  services.xserver = {
    enable = true;
    xkb.layout = "de";
    displayManager.lightdm.enable = false;
    displayManager.startx = {
      enable = true;
      # generateScript = false;
      # extraCommands = '''';
    };
    deviceSection = ''
      Option "TearFree" "true"
      Option "AccelMethod" "sna"
      Option "DRI" "3"
    '';
  };
}
