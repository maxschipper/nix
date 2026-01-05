{ flakeRoot, ... }:
{
  # NOTE:
  # https://github.com/einetuer/nix-easyroam#usage
  # , openssl pkcs12 -in Downloads/yoga.p12 -passin pass: -nokeys | , openssl x509 -noout -subject | sed -e 's/.*=//' -e
  #  's/\s*//' | wl-copy
  # identity in nmtui

  services.easyroam = {
    enable = true;
    networkmanager.enable = true;
    pkcsFile = "${flakeRoot}/modules/services/vpn/yoga.p12";
  };
}
