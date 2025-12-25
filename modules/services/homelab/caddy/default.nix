let
  domain = "nuc.lab";
in
{
  services.caddy = {
    enable = true;
    logFormat = "level INFO";
    globalConfig = ''
      # debug
      local_certs
    '';
    extraConfig = ''

      https://fritz.${domain} {
        reverse_proxy 10.0.0.1
      }

      https://${domain} {
        reverse_proxy localhost:5678
      }
      https://dash.${domain} https://www.${domain} {
        redir https://${domain}{uri} permanent
      }

      https://gitea.${domain} {
        reverse_proxy localhost:3000
      }
      https://git.${domain} {
        redir https://gitea.${domain}{uri} permanent
      }

      https://paperless.${domain} {
        reverse_proxy localhost:28981
      }

      https://btop.${domain} {
        reverse_proxy localhost:7682
      }

      https://coredns.${domain} {
        reverse_proxy localhost:8000
      }

      https://pdf.${domain} {
        reverse_proxy localhost:8592
      }

      https://adguard.${domain} {
        reverse_proxy localhost:3001
      }

      https://dns.adguard.${domain} {
        reverse_proxy localhost:54
      }

      https://webdav.${domain} {
        reverse_proxy localhost:2345
      }

      https://immich.${domain} {
        reverse_proxy localhost:2283
      }

      https://hass.${domain} {
        reverse_proxy localhost:8123
      }

      https://navidrome.${domain} {
        reverse_proxy localhost:4533
      }
    '';
  };
}

# the root.crt is at /var/lib/caddy/.local/share/caddy/pki/authorities/local/root.crt
