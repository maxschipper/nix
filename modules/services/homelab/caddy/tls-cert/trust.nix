# let
#   vars = import ../../../../vars.nix;
#   certPath = vars.nhFlake + "/modules/services/homelab/caddy/tls-cert/root.crt";
# in
{
  security.pki.certificates = [ (builtins.readFile ./root.crt) ];
}
