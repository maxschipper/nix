{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.amdgpu_top
    # pkgs.radeontop
    pkgs.glances
    pkgs.s0ix-selftest-tool
    pkgs.linuxKernel.packages.linux_6_16.cpupower
    pkgs.linuxKernel.packages.linux_6_16.turbostat
    pkgs.powertop
    pkgs.bottom
  ];
}
