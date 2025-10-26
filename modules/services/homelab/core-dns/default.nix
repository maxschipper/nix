{ lib, ... }:
{

  services.resolved.enable = lib.mkForce false;

  services.coredns = {
    enable = true;
    # extraArgs = [ "-dns.port=53" ];
    config = ''
      nuc.tail3035bf.ts.net {
        hosts {
          100.96.128.41 paperless.nuc.tail3035bf.ts.net gitea.nuc.tail3035bf.ts.net
          fallthrough
        }
        forward . 1.1.1.1
        log
        errors
      }
    '';
  };
}
