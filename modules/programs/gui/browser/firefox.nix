{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    nativeMessagingHosts.packages = [
      pkgs.firefoxpwa
      pkgs.ff2mpv-rust
    ];
    policies = {
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      FirefoxHome = {
        SponsoredStories = false;
        SponsoredTopSites = false;
        Stories = false;
      };
      # GenerativeAI = {
      #   Enabled = false;
      # };
      # SearchEngines = {
      #   Remove = [
      #     "Perplexity"
      #   ];
      # };
      PasswordManagerEnabled = false;
    };
  };

  environment.systemPackages = [
    pkgs.firefoxpwa
    pkgs.ff2mpv-rust
  ];
}
