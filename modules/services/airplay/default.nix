{ pkgs, ... }:
{
  # Publish this server and its address on the network
  services.avahi = {
    enable = true;
    nssmdns4 = true; # printing
    openFirewall = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      userServices = true;
    };
  };

  # services.pipewire = {
  #   # opens UDP ports 6001-6002
  #   raopOpenFirewall = true;

  #   extraConfig.pipewire = {
  #     "10-airplay" = {
  #       "context.modules" = [
  #         {
  #           name = "libpipewire-module-raop-discover";

  #           # increase the buffer size if you get dropouts/glitches
  #           # args = {
  #           #   "raop.latency.ms" = 500;
  #           # };
  #         }
  #       ];
  #     };
  #   };
  # };

  environment.systemPackages = [
    pkgs.uxplay
  ];
}
