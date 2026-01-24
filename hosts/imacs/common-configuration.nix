{
  imports = [
    ../../modules/system/nix
    ../../modules/system/tty/tty.nix
    ../../modules/system/bootloader/systemd.nix
    ../../modules/system/initrd/systemd.nix
    ../../modules/system/networking/networkmanager.nix
    ../../modules/system/localization
    ../../modules/system/users/max
    ../../modules/programs/cli/core
    ../../modules/programs/cli/nh
    ../../modules/programs/cli/shell/fish.nix
    ../../modules/programs/cli/zoxide
    ../../modules/services/ssh/openssh.nix
  ];
}
