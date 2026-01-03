{
  pkgs,
  lib,
  config,
  ...
}:
{
  environment.systemPackages = [
    pkgs.glances
    pkgs.s0ix-selftest-tool
    pkgs.linuxKernel.packages.linux_6_18.cpupower
    pkgs.linuxKernel.packages.linux_6_18.turbostat
    pkgs.powertop
    pkgs.bottom
  ]
  ++ lib.optionals (config.networking.hostName == "yoga") [
    pkgs.amdgpu_top
    pkgs.radeontop
    pkgs.nvtopPackages.amd
  ]
  ++ lib.optionals (config.networking.hostName == "nuc") [
    pkgs.nvtopPackages.intel
  ];
}
