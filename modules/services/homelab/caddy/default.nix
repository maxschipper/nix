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
      :80 {
        @gitea_root path /gitea
        redir @gitea_root /gitea/

        handle_path /gitea/* {
          reverse_proxy localhost:3000
        }

        # paperless doesnt work on a subpath only on root :(
        @paperless_root path /paperless
        redir @paperless_root /paperless/

        handle_path /paperless/* {
          reverse_proxy localhost:28981
        }
      }
    '';
  };
}
