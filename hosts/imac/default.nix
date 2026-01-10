{
  networking.hostName = "imac";
  imports = [

    ../../modules/services/vpn/netbird/server.nix

    ../../modules/services/vpn/tailscale
    ../../modules/services/vpn/tailscale/exit-node-server.nix

    ./configuration.nix
    ./hardware-configuration.nix

    # modules/SYSTEM
    ################
    # ../../modules/system/kernel/latest.nix
    # ../../modules/system/kernel/zen.nix

    # ../../modules/system/kernel/params/nuc.nix
    ../../modules/system/tty/tty.nix

    ../../modules/system/bootloader/systemd.nix
    ../../modules/system/initrd/systemd.nix

    ../../modules/system/networking/networkmanager.nix
    ../../modules/system/networking/resolved.nix
    ../../modules/system/networking/bluetooth.nix
    ../../modules/system/nix
    ../../modules/system/nix/comma.nix
    ../../modules/system/nix/nh.nix
    ../../modules/system/nix/nixos-cli.nix
    ../../modules/system/nix/nix-lsps.nix
    # ../../modules/system/nix/nix-ld.nix
    ../../modules/system/audio
    ../../modules/system/localization
    ../../modules/system/users/max.nix
    ../../modules/system/security/sops-nix.nix
    # ../../modules/system/power
    ../../modules/system/env-vars/xdg.nix

    # modules/SESSIONS
    ##################
    # ../../modules/sessions/dm/ly.nix
    # ../../modules/sessions/dm/greetd/tuigreet.nix
    # ../../modules/sessions/wm/hyprland.nix
    # ../../modules/sessions/wm/niri.nix

    # modules/SERVICES
    ##################
    ../../modules/services/remap/keyd.nix
    ../../modules/services/ssh/openssh.nix
    # ../../modules/services/streaming/sunshine.nix

    # modules/PROGRAMS
    ##################
    ../../modules/programs/cli
    ../../modules/programs/cli/shell/fish.nix
    ../../modules/programs/cli/shell/starship.nix

    # modules/DEVELOPMENT
    #####################
    # ../../modules/development/lsps
    # ../../modules/development/typst.nix

    # devtools
    #####################
    # ../../modules/development/tools/jj.nix
    # ../../modules/development/tools/direnv.nix

    # games
    #####################
    # ../../modules/programs/gui/games/minecraft.nix
  ];
}
