{
  services.coredns = {
    enable = true;
    # 100.x.x.x needs to be the tailscale ip so the clients can reach it
    # could add local lan ip above so local devices dont need tailscale but the dns is supplied via tailscale so useless for now, only needed if i add coredns to my routers dns, but dont know if it supports split dns
    # extraArgs = [ "-dns.port=53" ];
    config = ''
      nuc.lab {
        bind 100.96.128.41
        hosts {
          100.96.128.41 nuc.lab
          100.96.128.41 paperless.nuc.lab
          100.96.128.41 gitea.nuc.lab
          100.96.128.41 btop.nuc.lab
          100.96.128.41 coredns.nuc.lab
          100.96.128.41 fritz.nuc.lab
          100.96.128.41 pdf.nuc.lab
          100.96.128.41 adguard.nuc.lab
          100.96.128.41 dns.adguard.nuc.lab
        }
        log
        errors
        health :8000
      }
    '';
  };
}
