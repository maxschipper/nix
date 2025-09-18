{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    nativeMessagingHosts.packages = [
      pkgs.firefoxpwa
    ];
  };

  environment.systemPackages = [
    pkgs.firefoxpwa
  ];
}
