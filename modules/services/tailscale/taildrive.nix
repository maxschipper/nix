{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.davfs2
  ];
  users = {
    groups.davfs2 = { };
    users = {
      max.extraGroups = [ "davfs2" ];
      davfs2 = {
        isSystemUser = true;
        group = "davfs2";
      };
    };
  };
}
