{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.cage
  ];
  services.cage = {
    enable = true;
    user = "max";
    program = "${pkgs.moonlight-qt}/bin/moonlight";
  };
}
