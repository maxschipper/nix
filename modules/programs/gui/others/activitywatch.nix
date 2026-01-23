{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    activitywatch
    aw-watcher-window-wayland
    awatcher
  ];

  systemd.user.services.activity-watch = {
    description = "acitivitywatch aw-server service from nix config";

    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.activitywatch}/bin/aw-server";
      Restart = "on-failure";
    };
  };

  systemd.user.services.awatcher = {
    description = "acitivitywatch aw-server service from nix config";

    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.awatcher}/bin/awatcher";
      Restart = "on-failure";
    };
  };
}
