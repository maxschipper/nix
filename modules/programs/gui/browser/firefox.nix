{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    nativeMessagingHosts.packages = [
      pkgs.firefoxpwa
      pkgs.ff2mpv-rust
    ];
  };

  environment.systemPackages = [
    pkgs.firefoxpwa
    pkgs.ff2mpv-rust
  ];
}
