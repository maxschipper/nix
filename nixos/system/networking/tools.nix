{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    drill
    mtr
    nmap
    doggo
    dogedns
    # ipcalc
  ];
}
