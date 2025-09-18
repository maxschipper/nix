{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    extraPackages = [
      pkgs.bat-extras.batman
      pkgs.bat-extras.batdiff
      pkgs.bat-extras.prettybat
    ];
  };
}
