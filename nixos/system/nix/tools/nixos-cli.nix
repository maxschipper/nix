{
  config,
  flakeRepoRoot,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [ inputs.nixos-cli.nixosModules.nixos-cli ];

  services.nixos-cli = {
    enable = true;
    config = {
      config_location = flakeRepoRoot;
      # root_command = "doas";
      use_nvd = true;
      apply = {
        use_nom = true;
        reexec_as_root = true;
      };
      confirmation.empty = "default-yes";
      aliases = {
        test = [
          "apply"
          "--no-boot"
        ];
      };
    };
  };

  environment.systemPackages =
    lib.optionals config.services.nixos-cli.config.apply.use_nom [ pkgs.nix-output-monitor ]
    ++ lib.optionals config.services.nixos-cli.config.use_nvd [ pkgs.nvd ];
}
