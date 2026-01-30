{ pkgs, ... }:
{
  fonts = {
    fontconfig.enable = false;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      geist-font
      noto-fonts
      inter

      ibm-plex
      # public-sans

      # pkgs.jetbrains-mono
      # pkgs.material-design-icons
      # pkgs.material-icons
      # pkgs.material-symbols
    ];
  };
}
