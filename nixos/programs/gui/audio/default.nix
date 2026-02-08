{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # pavucontrol
    pwvucontrol
    # pwmenu
  ];
}
