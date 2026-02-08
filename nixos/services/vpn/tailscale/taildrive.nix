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

  systemd.mounts = [
    {
      description = "tailscale taildrive mount";
      what = "http://100.100.100.100:8080/max.schipper1@icloud.com/devnix/share";
      where = "/home/max/Documents/imac-share";
      # where = "/mnt/taildrive-devnix";
      type = "davfs";
      options = "rw,uid=1000,gid=100,_netdev";
      wantedBy = [ "multi-user.target" ];
      after = [ "network-online.target" ];
      requires = [ "network-online.target" ];
    }
  ];
  environment.etc."davfs2/secrets" = {
    text = ''
      http://100.100.100.100:8080/max.schipper1@icloud.com/devnix/share max "" 
    '';
    mode = "0600";
    uid = 0;
    gid = 0;
  };

}
