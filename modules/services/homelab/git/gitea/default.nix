{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.homelab.services.gitea;

  # theme-catppuccin = pkgs.fetchzip {
  #   url = "https://github.com/catppuccin/gitea/releases/latest/download/catppuccin-gitea.tar.gz";
  #   sha256 = "sha256-rZHLORwLUfIFcB6K9yhrzr+UwdPNQVSadsw6rg8Q7gs=";
  #   stripRoot = true;
  # };
  theme-github = pkgs.fetchzip {
    url = "https://github.com/lutinglt/gitea-github-theme/releases/latest/download/theme-github-base.tar.gz";
    sha256 = "sha256-neRyrTL9rTdU/eK5dRR77P+rVs+9g537uGlYBHqbDIA=";
    stripRoot = true;
  };
  gitea-assets-dir = "${config.services.gitea.stateDir}/custom/public/assets";
in
{
  config = lib.mkIf cfg.enable {

    systemd.services.gitea = {
      preStart = lib.mkAfter ''
        mkdir -p ${gitea-assets-dir}/css
        # rm -rf ${gitea-assets-dir}/css/ # not working, permission error use cp -f instead

        for theme in ${theme-github}; do
          cp -rfs "$theme"/. ${gitea-assets-dir}/css
        done
      '';
      # for theme in ${theme-catppuccin} ${theme-github}; do
    };

    services.gitea = {
      enable = cfg.enable;
      appName = "🍵 gitea";
      settings = {
        server = {
          HTTP_ADDR = cfg.ip;
          HTTP_PORT = cfg.port;
          ROOT_URL = cfg.url;
        };

        repository = {
          ENABLE_PUSH_CREATE_USER = true;
          DEFAULT_PUSH_CREATE_PRIVATE = false;

        };
        "repository.upload" = {
          FILE_MAX_SIZE = 500;
          MAX_FILES = 50;
        };
        service = {
          DISABLE_REGISTRATION = true;
        };
        ui = {
          SHOW_USER_EMAIL = false;
          DEFAULT_THEME = "github-auto";
          # THEMES = "gitea-auto, gitea-light, gitea-dark, github-auto, github-light, github-dark";
        };
        other = {
          SHOW_FOOTER_VERSION = false;
        };
      };
    };
  };
}
