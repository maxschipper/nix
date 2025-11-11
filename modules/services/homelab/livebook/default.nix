let
  vars = import ../../../vars.nix;
in
{
  services.livebook = {
    enableUserService = false;
    environmentFile = vars.nhFlake + "/modules/services/homelab/livebook/livebook.env";
    environment = {
      LIVEBOOK_PORT = 3002;
      # LIVEBOOK_IP = "0.0.0.0";
      # LIVEBOOK_BASE_URL_PATH = "https://livebook.nuc.lab";
      LIVEBOOK_SHUTDOWN_ENABLED = true;
    };
    # extraPackages = with pkgs; [
    #   gcc
    #   gnumake
    # ];
  };
}
