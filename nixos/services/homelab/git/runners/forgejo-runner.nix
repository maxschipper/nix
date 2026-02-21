{
  config,
  flakeStoreRoot,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.homelab.services.forgejoRunner;
  instanceName = "nuc";
in
{
  config = lib.mkIf cfg.enable {

    sops.secrets."FORGEJO_RUNNER_TOKEN" = {
      sopsFile = flakeStoreRoot + /secrets/forgejo-runner.env;
      format = "dotenv";
      restartUnits = [ "gitea-runner-${instanceName}.service" ];
    };

    virtualisation.docker.enable = true;

    services.gitea-actions-runner = {
      package = pkgs.forgejo-runner;
      instances.${instanceName} = {
        enable = true;
        tokenFile = config.sops.secrets."FORGEJO_RUNNER_TOKEN".path;
        url = "https://codeberg.org";
        name = "nuc-n150";
        hostPackages = [ ];
        labels = [
          "docker:docker://ghcr.io/catthehacker/ubuntu:act-latest"
          "ubuntu-latest:docker://ghcr.io/catthehacker/ubuntu:latest"
        ];

        # https://gitea.com/gitea/act_runner/src/branch/main/internal/pkg/config/config.example.yaml
        settings = {
          container.network = "bridge";
          runner = {
            timeout = "1h";
            shutdown_timeout = "1h";
          };
        };
      };
    };

  };
}
