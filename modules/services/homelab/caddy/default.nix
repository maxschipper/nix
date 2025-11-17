{
  services.caddy = {
    enable = true;
    extraConfig = ''
      https://nuc.lab {
        tls internal
        reverse_proxy localhost:5678
      }

      https://gitea.nuc.lab {
        tls internal
        reverse_proxy localhost:3000
      }

      https://paperless.nuc.lab {
        tls internal
        reverse_proxy localhost:28981
      }

      https://btop.nuc.lab {
        tls internal
        reverse_proxy localhost:7682
      }

      https://coredns.nuc.lab {
        tls internal
        reverse_proxy localhost:8000
      }

      https://fritz.nuc.lab {
        tls internal
        reverse_proxy 10.0.0.1
      }

      https://pdf.nuc.lab {
        tls internal
        reverse_proxy localhost:8592
      }

      https://adguard.nuc.lab {
        tls internal
        reverse_proxy localhost:3001
      }

      https://dns.adguard.nuc.lab {
        tls internal
        reverse_proxy localhost:54
      }

      https://todo.nuc.lab {
        tls internal
        reverse_proxy localhost:3002
      }

      https://webdav.nuc.lab {
        tls internal
        reverse_proxy localhost:2345
      }

    '';
  };
}

# the root.crt is at /var/lib/caddy/.local/share/caddy/pki/authorities/local/root.crt
