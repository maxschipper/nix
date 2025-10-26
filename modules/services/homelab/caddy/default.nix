{
  services.caddy = {
    enable = true;
    # extraConfig = ''
    #   :80 {
    #     handle_path /gitea/* {
    #       reverse_proxy localhost:3000
    #     }

    #     handle_path /paperless/* {
    #       reverse_proxy localhost:28981
    #     }
    #   }
    # '';
    extraConfig = ''
      http://gitea.nuc.tail3035bf.ts.net {
        reverse_proxy localhost:3000
      }

      http://paperless.nuc.tail3035bf.ts.net {
        reverse_proxy localhost:28981
      }
    '';
  };
}
