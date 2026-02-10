{ pkgs, ... }:
{
  programs.localsend.enable = true;

  environment.systemPackages = with pkgs; [
    nmgui
    # kdePackages.dolphin
    gnome-disk-utility
    # gnome-font-viewer
    # gimp
    cheese
    # snapshot
    zathura
    dragon-drop
    mpv
    imv
    satty
    xournalpp
    feishin
  ];
}
