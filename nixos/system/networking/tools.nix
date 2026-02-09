{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ldns
    mtr
    nmap
    doggo
    dogedns
    # ipcalc
  ];
}
