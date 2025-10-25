{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:
{
  # programs.yazi.enable = true; # disables .config/yazi
  # programs.yazi.plugins = { # NOTE: still using ya pack
  # foo = ./foo; # example for local
  # inherit (pkgs.yaziPlugins) mediainfo;
  # inherit (pkgs.yaziPlugins) glow;
  # inherit (pkgs.yaziPlugins) rich-preview;
  # };

  # plugin deps
  environment.systemPackages =
    if config.networking.hostName == "nuc" then
      [
        pkgs-unstable.yazi
        pkgs-unstable.mediainfo
        pkgs-unstable.glow
        pkgs-unstable.hexyl
        pkgs-unstable.rich-cli
        pkgs-unstable.trash-cli

        pkgs-unstable.clipboard-jh
      ]
    else
      [
        pkgs.yazi
        pkgs.mediainfo
        pkgs.glow
        pkgs.hexyl
        pkgs.rich-cli
        pkgs.trash-cli

        pkgs.clipboard-jh
      ];

  environment.sessionVariables = {
    CLIPBOARD_NOGUI = "1";
  };

}
