# { pkgs, ... }:
{
  services.sunshine = {
    enable = true;
    autoStart = false;
    openFirewall = false;
    # settings = {
    #   sunshine_name = "nixos";
    # }; # if this is set no config from the webui is possible; same for "applications"

    # applications = {
    #   env = {
    #     PATH = "$(PATH):$(HOME)/.local/bin";
    #   };
    #   apps = [
    #     {
    #       name = "1440p Desktop";
    #       prep-cmd = [
    #         {
    #           do = "${pkgs.kdePackages.libkscreen}/bin/kscreen-doctor output.DP-4.mode.2560x1440@144";
    #           undo = "${pkgs.kdePackages.libkscreen}/bin/kscreen-doctor output.DP-4.mode.3440x1440@144";
    #         }
    #       ];
    #       exclude-global-prep-cmd = "false";
    #       auto-detach = "true";
    #     }
    #   ];
    # };
  };
}
