{
  security.pki.certificates = [ (builtins.readFile ./root.crt) ];
}
