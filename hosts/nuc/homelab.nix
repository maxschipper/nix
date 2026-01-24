{
  imports = [
    ../../modules/services/homelab

    ../../modules/services/homelab/dashboard/glance.nix
    ../../modules/services/homelab/paperless
    ../../modules/services/homelab/git/gitea
    # ../../modules/services/homelab/ttyd/btop.nix
    ../../modules/services/homelab/caddy
    ../../modules/services/homelab/caddy/tls-cert/trust.nix
    # ../../modules/services/homelab/dns/core-dns
    ../../modules/services/homelab/dns/adguardhome
    # ../../modules/services/homelab/pdf/stirling-pdf.nix
    ../../modules/services/homelab/immich
    ../../modules/services/homelab/home-assistant
    ../../modules/services/homelab/music/navidrome.nix
    ../../modules/services/homelab/music/lidarr.nix
    ../../modules/services/homelab/music/deemix.nix

    ../../modules/services/homelab/webdav

    ../../modules/services/homelab/monitoring/grafana
    ../../modules/services/homelab/monitoring/prometheus
    ../../modules/services/homelab/monitoring/prometheus/exporters/node.nix
    ../../modules/services/homelab/monitoring/prometheus/exporters/smart.nix

    ../../modules/programs/gui/browser/chromium.nix
    # ../../modules/sessions/wm/cage/youtube.nix

    ../../modules/sessions/wm/xserver
    ../../modules/sessions/wm/xserver/matchbox.nix
    ../../modules/sessions/wm/xserver/xob.nix

  ];
}
