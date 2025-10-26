{
  services.caddy = {
    enable = true;
    extraConfig = ''
      http://gitea.nuc.lab {
        reverse_proxy localhost:3000
      }

      http://paperless.nuc.lab {
        reverse_proxy localhost:28981
      }
    '';
  };
}
