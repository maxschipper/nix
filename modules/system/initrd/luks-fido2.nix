{
  boot.initrd = {
    luks.devices.root = {
      crypttabExtraOpts = [ "fido2-device=auto" ];
      device = "/dev/nvme0n1p2";
    };

    systemd.enable = true;
  };
}
