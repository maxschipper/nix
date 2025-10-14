{ ... }:
let
  vars = import ../../vars.nix;
in
{
  services.easyroam = {
    enable = true;
    networkmanager.enable = true;
    pkcsFile = vars.nhFlake + "/modules/services/vpn/yoga.p12";
  };
}
