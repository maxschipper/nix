let
  my-domain = "nuc.lab";

  lan-ip = "10.0.0.2";
  tailscale-ip = "100.96.128.41";
  netbird-ip = "100.64.0.230";

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
          lan-ip
          tailscale-ip
          netbird-ip
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
        use_private_ptr_resolvers = true;
        local_ptr_upstreams = [
          "[10.0.0.1]"
        ];

      };

      filtering = {
        rewrites_enabled = true;
        rewrites = [
          # lan
          {
            domain = my-domain;
            answer = lan-ip;
            enabled = true;
          }

          # tailscale
          {
            domain = my-domain;
            answer = tailscale-ip;
            enabled = true;
          }

          # netbird
          {
            domain = my-domain;
            answer = netbird-ip;
            enabled = true;
          }

          # CNAME for subdomains
          {
            domain = "*.${my-domain}";
            answer = my-domain;
            enabled = true;
          }
        ];
      };

      # ratelimit = 0; # DDoS protection
    };
  };
}
