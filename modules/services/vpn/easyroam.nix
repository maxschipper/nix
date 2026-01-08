{
  config,
  flakeRoot,
  inputs,
  ...
}:
let
  vars = import ../../vars.nix;
in
{
  imports = [ inputs.nix-easyroam.nixosModules.nix-easyroam ];

  sops.secrets."easyroam-cert.p12" = {
    sopsFile = "${vars.nhFlake}/secrets/easyroam-yoga.p12.enc";
    format = "binary";
    restartUnits = [ "easyroam-install.service" ];
  };

  services.easyroam = {
    enable = true;
    networkmanager.enable = true;
    pkcsFile = config.sops.secrets."easyroam-cert.p12".path;
  };

  # NOTE:
  # https://github.com/einetuer/nix-easyroam#usage
  #
  # , openssl pkcs12 -in Downloads/yoga.p12 -passin pass: -nokeys | , openssl x509 -noout -subject | sed -e 's/.*=//' -e
  #  's/\s*//' | wl-copy
  # identity in nmtui
}
