{ lib, pkgs, ... }:
{
  services.ttyd = {
    enable = true;
    port = lib.mkDefault 7681;
    writeable = lib.mkDefault false;
    clientOptions = {
      fontSize = "16";
      # fontFamily = "JetBrains Mono Nerd Font";
    };
  };

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];

}
