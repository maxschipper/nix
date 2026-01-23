{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ swayosd ];

  systemd.user.services.sway-osd = {
    description = "sway-osd service from nix config";

    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.swayosd}/bin/swayosd-server";
      Restart = "on-failure";
    };
  };
}
