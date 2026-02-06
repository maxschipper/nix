{ flakeStoreRoot, ... }:
{
  imports = [
    # (flakeStoreRoot + modules/services/homelab/caddy/tls-cert/trust.nix)

    (flakeStoreRoot + modules/services/homelab/options.nix)

    (flakeStoreRoot + modules/services/homelab/dashboard/glance.nix)
    (flakeStoreRoot + modules/services/homelab/paperless)
    (flakeStoreRoot + modules/services/homelab/git/gitea)
    # (flakeStoreRoot + modules/services/homelab/ttyd/btop.nix)
    (flakeStoreRoot + modules/services/homelab/caddy)
    # (flakeStoreRoot + modules/services/homelab/dns/core-dns)
    (flakeStoreRoot + modules/services/homelab/dns/adguardhome)
    # (flakeStoreRoot + modules/services/homelab/pdf/stirling-pdf.nix)
    (flakeStoreRoot + modules/services/homelab/immich)
    (flakeStoreRoot + modules/services/homelab/home-assistant)
    (flakeStoreRoot + modules/services/homelab/music/navidrome.nix)
    (flakeStoreRoot + modules/services/homelab/music/lidarr.nix)
    (flakeStoreRoot + modules/services/homelab/music/deemix.nix)

    (flakeStoreRoot + modules/services/homelab/webdav)

    (flakeStoreRoot + modules/services/homelab/monitoring/grafana)
    (flakeStoreRoot + modules/services/homelab/monitoring/prometheus)
    (flakeStoreRoot + modules/services/homelab/monitoring/prometheus/exporters/node.nix)
    (flakeStoreRoot + modules/services/homelab/monitoring/prometheus/exporters/smart.nix)
    (flakeStoreRoot + modules/services/homelab/monitoring/prometheus/exporters/adguard)

  ];
}
