{
  networking.firewall.allowedTCPPorts = [
    53
    80
    443
  ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  services.adguardhome = {
    enable = true;
    host = "0.0.0.0";
    port = 3001; # web ui
    mutableSettings = true; # changes made in the web ui persist between restarts
    extraArgs = [ ]; # extra cli args
    settings = {
      dns = {
        port = 53; # default dns port
        bind_hosts = [
          "127.0.0.1"
          "10.0.0.2" # local ip for router
          "100.96.128.41" # tailscale ip for tailnet
        ];
      };
      # if using this declaratively the rewrites are disabeld by default
      # so one would have to enable them after every config change
      # filtering = {
      # rewrites = [
      # {
      #   domain = "*.nuc.lab";
      #   answer = "10.0.0.2";
      # }
      # {
      #   domain = "nuc.lab";
      #   answer = "10.0.0.2";
      # }
      # ];
      # };

      # ratelimit = 0; # DDoS protection
    };
  };
}
