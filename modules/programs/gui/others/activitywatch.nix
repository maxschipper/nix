{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    activitywatch
    awatcher
    # aw-watcher-window-wayland
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
    description = "acitivitywatch watcher(awatcher) service from nix config";

    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.awatcher}/bin/awatcher -vv";
      Restart = "on-failure";
    };
  };
}
