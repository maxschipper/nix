let
  domain = "nuc.lab";
in
{
  services.coredns = {
    enable = false;
    # 100.x.x.x needs to be the tailscale ip so the clients can reach it
    # could add local lan ip above so local devices dont need tailscale but the dns is supplied via tailscale so useless for now, only needed if i add coredns to my routers dns, but dont know if it supports split dns
    # extraArgs = [ "-dns.port=53" ];

    # TODO: could use CNAMEs for everything after nuc.lab
    config = ''
      ${domain} {
        bind 100.96.128.41
        hosts {
          100.96.128.41 ${domain}
          100.96.128.41 dash.${domain}
          100.96.128.41 paperless.${domain}
          100.96.128.41 gitea.${domain}
          100.96.128.41 btop.${domain}
          100.96.128.41 coredns.${domain}
          100.96.128.41 fritz.${domain}
          100.96.128.41 pdf.${domain}
          100.96.128.41 adguard.${domain}
          100.96.128.41 dns.adguard.${domain}
          100.96.128.41 todo.${domain}
          100.96.128.41 webdav.${domain}
        }
        log
        errors
        health :8000
      }
    '';
  };
}
