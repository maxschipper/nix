{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      geist-font
      noto-fonts
      inter

      ibm-plex
      maple-mono.Normal-OTF
      # maple-mono.Normal-NF-unhinted
      # public-sans

      # pkgs.jetbrains-mono
      # pkgs.material-design-icons
      # pkgs.material-icons
      # pkgs.material-symbols
    ];
  };
}
