# sudo systemd-cryptenroll --fido2-device=auto /dev/nvme0n1p2
# sudo cryptsetup luksDump /dev/nvme0n1p2
# sudo cryptsetup luksKillSlot /dev/nvme0n1p2 2 # IMPORTANT: check which keyslot to kill

{
  boot.initrd = {
    luks.devices.root = {
      crypttabExtraOpts = [ "fido2-device=auto" ];
      device = "/dev/nvme0n1p2";
    };

    systemd.enable = true;
  };
}
