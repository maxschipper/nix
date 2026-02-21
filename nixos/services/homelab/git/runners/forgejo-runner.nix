{
  config,
  flakeStoreRoot,
  pkgs,
  ...
}:
let
  instanceName = "nuc";
in
{
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
      url = "https://codeberg.org";
      name = "nuc-n150";
      tokenFile = config.sops.secrets."FORGEJO_RUNNER_TOKEN".path;

      # Labels used to map jobs to their runtime environment. Changing these labels currently requires a new registration token. Many common actions require bash, git and nodejs, as well as a filesystem that follows the filesystem hierarchy standard.
      labels = [
        # #  provide a debian base with nodejs for actions
        # "debian-latest:docker://node:18-bullseye"
        # #  fake the ubuntu name, because node provides no ubuntu builds
        # "ubuntu-latest:docker://node:18-bullseye"
        # #  provide native execution on the host
        # "native:host"

        "docker:docker://ghcr.io/catthehacker/ubuntu:act-latest"
        "ubuntu-latest:docker://ghcr.io/catthehacker/ubuntu:latest"
      ];

      hostPackages = [ ];

      # Configuration for  act_runner daemon.
      # See https://gitea.com/gitea/act_runner/src/branch/main/internal/pkg/config/config.example.yaml
      settings = {
        container = {
          network = "bridge";
        };
        runner = {
          timeout = "1h";
          shutdown_timeout = "1h";
        };
      };
    };
  };
}
