{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.writeShellApplication {
      name = "nb-status";
      runtimeInputs = [
        pkgs.gawk
        pkgs.netbird
      ];
      text = builtins.readFile ./nb-status.sh;
    })
  ];
}
