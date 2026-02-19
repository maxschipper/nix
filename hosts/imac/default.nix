{ flakeStoreRoot, ... }:
{
  networking.hostName = "imac";
  imports = [

    (flakeStoreRoot + /nixos/services/vpn/netbird/server.nix)
    (flakeStoreRoot + /nixos/services/homelab/monitoring/prometheus/exporters/node/external.nix)

    # (flakeStoreRoot + /nixos/services/vpn/tailscale)
    # (flakeStoreRoot + /nixos/services/vpn/tailscale/exit-node-server.nix)

    ./configuration.nix
    ./hardware-configuration.nix

    # nixos/SYSTEM
    ################
    # (flakeStoreRoot + /nixos/system/kernel/latest.nix)
    # (flakeStoreRoot + /nixos/system/kernel/zen.nix)

    # (flakeStoreRoot + /nixos/system/kernel/params/nuc.nix)
    (flakeStoreRoot + /nixos/system/tty/tty.nix)

    (flakeStoreRoot + /nixos/system/bootloader/systemd.nix)
    (flakeStoreRoot + /nixos/system/initrd/systemd.nix)

    (flakeStoreRoot + /nixos/system/networking/networkmanager.nix)
    (flakeStoreRoot + /nixos/system/networking/resolved.nix)
    (flakeStoreRoot + /nixos/system/networking/bluetooth.nix)

    (flakeStoreRoot + /nixos/system/nix)
    # (flakeStoreRoot + /nixos/system/nix/nix-lsps.nix)
    # (flakeStoreRoot + /nixos/system/nix/nix-ld.nix)
    # (flakeStoreRoot + /nixos/system/nix/tools/comma.nix)
    (flakeStoreRoot + /nixos/system/nix/tools/nh.nix)
    # (flakeStoreRoot + /nixos/system/nix/tools/nixf.nix)
    # (flakeStoreRoot + /nixos/system/nix/tools/nixos-cli.nix)
    # (flakeStoreRoot + /nixos/system/nix/tools/nixpkgs-track.nix)
    # (flakeStoreRoot + /nixos/system/nix/tools/rippkgs.nix)
    # (flakeStoreRoot + /nixos/system/nix/tools/statix.nix)

    # (flakeStoreRoot + /nixos/system/audio)
    (flakeStoreRoot + /nixos/system/localization)
    (flakeStoreRoot + /nixos/system/users/max)
    (flakeStoreRoot + /nixos/system/security/sops-nix.nix)
    # (flakeStoreRoot + /nixos/system/power)
    (flakeStoreRoot + /nixos/system/xdg/baseDirSpec)

    # nixos/SESSIONS
    ##################
    # (flakeStoreRoot + /nixos/sessions/dm/ly.nix)
    # (flakeStoreRoot + /nixos/sessions/dm/greetd/tuigreet.nix)
    # (flakeStoreRoot + /nixos/sessions/wm/hyprland.nix)
    # (flakeStoreRoot + /nixos/sessions/wm/niri.nix)

    # nixos/SERVICES
    ##################
    (flakeStoreRoot + /nixos/services/ssh/openssh.nix)
    # (flakeStoreRoot + /nixos/services/remap/keyd.nix)
    # (flakeStoreRoot + /nixos/services/streaming/sunshine.nix)

    # nixos/PROGRAMS
    ##################
    (flakeStoreRoot + /nixos/programs/cli)
    (flakeStoreRoot + /nixos/programs/cli/shell/fish.nix)
    # (flakeStoreRoot + /nixos/programs/cli/shell/starship.nix)

    # nixos/DEVELOPMENT
    #####################
    # (flakeStoreRoot + /nixos/development/lsps)
    # (flakeStoreRoot + /nixos/development/typst.nix)

    # devtools
    #####################
    # (flakeStoreRoot + /nixos/development/tools/jj.nix)
    # (flakeStoreRoot + /nixos/development/tools/direnv.nix)

    # games
    #####################
    # (flakeStoreRoot + /nixos/programs/gui/games/minecraft.nix)
  ];
}
