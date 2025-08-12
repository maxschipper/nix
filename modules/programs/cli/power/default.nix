{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    s0ix-selftest-tool
    linuxKernel.packages.linux_6_16.cpupower
    linuxKernel.packages.linux_6_16.turbostat
  ];
}
