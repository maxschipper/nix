{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    qutebrowser
    zenity # for gtk file dialogs
  ];
}
