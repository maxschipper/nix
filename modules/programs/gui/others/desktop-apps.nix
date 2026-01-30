{ pkgs, ... }:
{
  programs.localsend.enable = true;

  environment.systemPackages = with pkgs; [
    nmgui
    # kdePackages.dolphin
    nautilus
    gnome-disk-utility
    # gnome-font-viewer
    # gimp
    cheese
    # snapshot
    zathura
    dragon-drop
    mpv
    imv
    xournalpp
    feishin
  ];
}
