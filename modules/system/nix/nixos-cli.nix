let
  vars = import ../../vars.nix;
in
{
  services.nixos-cli = {
    enable = true;
    config = {
      config_location = vars.nixosConfigPath;
      # root_command = "doas";
      use_nvd = true;
      apply.use_nom = true;
      aliases = {
        test = [
          "apply"
          "--no-boot"
        ];
      };
    };
  };
}
