{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ swww ];

  systemd.user.services.swww = {
    description = "swww service from nix config";

    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.swww}/bin/swww-daemon";
      Restart = "on-failure";
    };
  };
}
