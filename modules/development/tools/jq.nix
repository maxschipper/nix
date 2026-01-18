{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jq
    jqp
    play
  ];
}
