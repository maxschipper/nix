{ pkgs, ... }:
{
  # programs.yazi.enable = true; # disables .config/yazi
  # programs.yazi.plugins = { # NOTE: still using ya pack
  # foo = ./foo; # example for local
  # inherit (pkgs.yaziPlugins) mediainfo;
  # inherit (pkgs.yaziPlugins) glow;
  # inherit (pkgs.yaziPlugins) rich-preview;
  # };

  # plugin deps
  environment.systemPackages = [
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
