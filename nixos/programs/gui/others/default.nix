{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.gparted
    pkgs.ffmpeg-full
    # pkgs.btrfs-assistant
    # pkgs.handbrake
    # pkgs.vscodium-fhs
  ];
}
