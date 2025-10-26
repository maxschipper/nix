{ lib, ... }:
{

  services.resolved.enable = lib.mkForce false;

  services.coredns = {
    enable = true;
    # 100.x.x.x needs to be the tailscale ip so the clients can reach it
    # could add local lan ip above so local devices dont need tailscale but the dns is supplied via tailscale so useless for now, only needed if i add coredns to my routers dns, but dont know if it supports split dns
    config = ''
      nuc.lab {
        hosts {
          100.96.128.41 nuc.lab *.nuc.lab
          fallthrough
        }
        log
        errors
      }
    '';
    # extraArgs = [ "-dns.port=53" ];
  };
}
