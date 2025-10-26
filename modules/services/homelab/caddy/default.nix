{
  services.caddy = {
    enable = true;
    extraConfig = ''
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
    '';
  };
}

# the root.crt is at /var/lib/caddy/.local/share/caddy/pki/authorities/local/root.crt
