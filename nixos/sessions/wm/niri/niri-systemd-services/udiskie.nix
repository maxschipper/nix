{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ udiskie ];

  systemd.user.services.udiskie = {
    description = "udiskie(automount) service from nix config";

    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.udiskie}/bin/udiskie";
      Restart = "on-failure";
    };
  };
}
