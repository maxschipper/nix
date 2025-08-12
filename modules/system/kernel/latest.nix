{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    # "quiet"
    "8250.nr_uarts=0"
    "console=tty0"
    "amd_pstate=active"
    "resume_offset=533760"
  ];
}
