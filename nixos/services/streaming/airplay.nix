{ pkgs, ... }:
{
  networking.firewall = {
    allowedTCPPorts = [
      7000
      7001
      7100
    ];
    allowedUDPPorts = [
      6000
      6001
      7011
    ];
  };

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

  environment.systemPackages = [
    pkgs.uxplay
  ];

  services.pipewire = {
    # opens UDP ports 6001-6002
    raopOpenFirewall = true;
    extraConfig.pipewire = {
      "10-airplay" = {
        "context.modules" = [
          {
            name = "libpipewire-module-raop-discover";
            # increase the buffer size if you get dropouts/glitches
            # args = {
            #   "raop.latency.ms" = 500;
            # };
          }
        ];
      };
    };
  };

}
