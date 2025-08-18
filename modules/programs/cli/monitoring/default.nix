{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.amdgpu_top
    # pkgs.radeontop
    pkgs.glances
  ];
}
