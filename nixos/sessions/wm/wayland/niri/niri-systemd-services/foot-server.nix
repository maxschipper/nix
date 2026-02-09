{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.user.targets.graphical-session.wants = [ "foot-server.socket" ];
  assertions = [
    {
      assertion = config.programs.foot.enable || lib.elem pkgs.foot config.environment.systemPackages;
      message =
        "You enabled foot-server.service, but 'foot' is not installed. "
        + "Install is using 'programs.foot.enable' or add 'pkgs.foot' to systemPackages.";
    }
  ];
}
