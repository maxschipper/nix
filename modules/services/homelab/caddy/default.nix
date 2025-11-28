{
  services.caddy = {
    enable = true;
    logFormat = "level INFO";
    globalConfig = ''
      # debug
      local_certs
    '';
    extraConfig = ''

      https://fritz.nuc.lab {
        reverse_proxy 10.0.0.1
      }

      https://nuc.lab {
        reverse_proxy localhost:5678
      }
      https://dash.nuc.lab https://www.nuc.lab {
        redir https://nuc.lab{uri} permanent
      }

      https://gitea.nuc.lab {
        reverse_proxy localhost:3000
      }
      https://git.nuc.lab {
        redir https://gitea.nuc.lab{uri} permanent
      }

      https://paperless.nuc.lab {
        reverse_proxy localhost:28981
      }

      https://btop.nuc.lab {
        reverse_proxy localhost:7682
      }

      https://coredns.nuc.lab {
        reverse_proxy localhost:8000
      }

      https://pdf.nuc.lab {
        reverse_proxy localhost:8592
      }

      https://adguard.nuc.lab {
        reverse_proxy localhost:3001
      }

      https://dns.adguard.nuc.lab {
        reverse_proxy localhost:54
      }

      https://webdav.nuc.lab {
        reverse_proxy localhost:2345
      }

      https://immich.nuc.lab {
        reverse_proxy localhost:2283
      }
    '';
  };
}

# the root.crt is at /var/lib/caddy/.local/share/caddy/pki/authorities/local/root.crt
