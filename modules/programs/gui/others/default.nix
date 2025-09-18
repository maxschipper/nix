{ pkgs, ... }:
{
  imports = [
    ./desktop-apps.nix
  ];

  programs.localsend.enable = true;

  environment.systemPackages = with pkgs; [
    gparted
    xournalpp
    gimp
    ffmpeg-full
    btrfs-assistant
    handbrake
    freecad-wayland
  ];
}
