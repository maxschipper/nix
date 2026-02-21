{
  imports = [
    ./options.nix

    ./dashboard/glance
    ./paperless
    ./git/gitea
    ./git/runners/forgejo-runner.nix
    #./ttyd/btop
    ./caddy
    #./dns/core-dns
    ./dns/adguardhome
    #./pdf/stirling-pdf
    ./immich
    ./home-assistant
    ./music/navidrome
    ./music/deemix

    ./webdav

    ./monitoring/grafana
    ./monitoring/prometheus
    ./monitoring/prometheus/exporters

  ];
}
