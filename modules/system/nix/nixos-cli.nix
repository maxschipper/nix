{
  config,
  flakeRoot,
  lib,
  pkgs,
  ...
}:
{
  services.nixos-cli = {
    enable = true;
    config = {
      config_location = flakeRoot;
      # root_command = "doas";
      use_nvd = true;
      apply.use_nom = true;
      confirmation.empty = "default-yes";
      aliases = {
        test = [
          "apply"
          "--no-boot"
        ];
        a = [
          "apply"
        ];
      };
    };
  };

  environment.systemPackages =
    lib.optionals config.services.nixos-cli.config.apply.use_nom [ pkgs.nix-output-monitor ]
    ++ lib.optionals config.services.nixos-cli.config.use_nvd [ pkgs.nvd ];
}
