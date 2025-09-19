{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.moonlight-qt
  ];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
