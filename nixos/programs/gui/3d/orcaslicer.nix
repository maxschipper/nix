{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.orca-slicer
  ];

  # https://wiki.bambulab.com/en/general/printer-network-ports
  networking.firewall = {
    allowedTCPPorts = [
      8883 # mqtt
      990 # ftp
    ];
    # ftp
    allowedTCPPortRanges = [
      {
        from = 50000;
        to = 50100;
      }
    ];

    # Device discovering SSDP. multicast/broadcast
    allowedUDPPorts = [
      # 1990 # docs say this port? but SSDP is 1900
      1900
      2021
    ];
  };
}
