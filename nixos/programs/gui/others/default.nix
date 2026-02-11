{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.gparted
    # pkgs.btrfs-assistant
    # pkgs.handbrake
    # pkgs.vscodium-fhs
  ];
}
