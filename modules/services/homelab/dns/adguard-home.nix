let
  domain = "nuc.lab";
in
{
  networking.firewall.allowedTCPPorts = [
    53
    80
    443
  ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  # https://github.com/quic-go/quic-go/wiki/UDP-Buffer-Sizes
  boot.kernel.sysctl = {
    "net.core.rmem_max" = 7500000;
    "net.core.wmem_max" = 7500000;
  };

  services.adguardhome = {
    enable = true;
    host = "0.0.0.0";
    port = 3001; # web ui
    mutableSettings = true; # changes made in the web ui persist between restarts
    extraArgs = [ ]; # extra cli args
    settings = {
      dns = {
        port = 53; # default dns port
        bind_hosts = [
          "127.0.0.1"
          "10.0.0.2" # local ip for router
          "100.96.128.41" # tailscale ip for tailnet
          "100.64.0.230" # netbird
        ];
        upstream_mode = "parallel";
        upstream_dns = [
          "quic://unfiltered.adguard-dns.com"
          "quic://p0.freedns.controld.com"
          #"https://dns10.quad9.net/dns-query"
          # "quic://dns.quad9.net"
          #"quic://dot.sb"
        ];
        fallback_dns = [
          "tls://dns.quad9.net"
          "https://dns.quad9.net/dns-query"
        ];
        bootstrap_dns = [
          # "1.1.1.1"
          # "8.8.8.8"
          "9.9.9.9"
          "149.112.112.112"
          "2620:fe::fe"
          "2620:fe::f9"
        ];
      };

      # if using this declaratively the rewrites are disabeld by default
      # so one would have to enable them after every config change
      filtering = {
        rewrites_enabled = true;
        rewrites = [
          # lan
          {
            domain = "*.${domain}";
            answer = "10.0.0.2";
            enabled = true;
          }
          {
            domain = "${domain}";
            answer = "10.0.0.2";
            enabled = true;
          }

          # tailscale
          {
            domain = "*.${domain}";
            answer = "100.96.128.41";
            enabled = true;
          }
          {
            domain = "${domain}";
            answer = "100.96.128.41";
            enabled = true;
          }

          # netbird
          {
            domain = "*.${domain}";
            answer = "100.64.0.230";
            enabled = true;
          }
          {
            domain = "${domain}";
            answer = "100.64.0.230";
            enabled = true;
          }
        ];
      };

      # ratelimit = 0; # DDoS protection
    };
  };
}
