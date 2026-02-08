{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ sunsetr ];

  systemd.user.services.sunsetr = {
    description = "sunsetr service from nix config";

    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.sunsetr}/bin/sunsetr";
      Restart = "on-failure";
    };
  };
}
