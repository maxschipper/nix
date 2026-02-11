{ flakeStoreRoot, ... }:
{
  networking.hostName = "nuc";
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./homelab.nix

    # nixos/SYSTEM
    ################
    (flakeStoreRoot + /nixos/system/kernel/latest.nix)
    # (flakeStoreRoot + /nixos/system/kernel/zen.nix)
    (flakeStoreRoot + /nixos/system/kernel/params/nuc.nix)

    (flakeStoreRoot + /nixos/system/bootloader/systemd.nix)
    (flakeStoreRoot + /nixos/system/initrd/systemd.nix)
    # (flakeStoreRoot + /nixos/system/initrd/luks-fido2.nix)

    (flakeStoreRoot + /nixos/system/audio)
    (flakeStoreRoot + /nixos/system/home-manager.nix)
    (flakeStoreRoot + /nixos/system/localization)
    (flakeStoreRoot + /nixos/system/networking/bluetooth.nix)
    (flakeStoreRoot + /nixos/system/networking/networkmanager.nix)
    (flakeStoreRoot + /nixos/system/networking/resolved.nix)
    (flakeStoreRoot + /nixos/system/networking/tools.nix)
    (flakeStoreRoot + /nixos/system/nix)
    (flakeStoreRoot + /nixos/system/nix/comma.nix)
    (flakeStoreRoot + /nixos/system/nix/nh.nix)
    # (flakeStoreRoot + /nixos/system/nix/nix-ld.nix)
    (flakeStoreRoot + /nixos/system/nix/nix-lsps.nix)
    (flakeStoreRoot + /nixos/system/nix/nixos-cli.nix)
    # (flakeStoreRoot + /nixos/system/power # (laptop specific))
    # (flakeStoreRoot + /nixos/system/security/nitrokey.nix)
    (flakeStoreRoot + /nixos/system/security/sops-nix.nix)
    # (flakeStoreRoot + /nixos/system/security/tpm.nix)
    (flakeStoreRoot + /nixos/system/users/max)
    (flakeStoreRoot + /nixos/system/xdg/baseDirSpec)

    # nixos/SESSIONS
    ##################
    # (flakeStoreRoot + /nixos/sessions/dm/ly.nix)
    # (flakeStoreRoot + /nixos/sessions/dm/greetd/tuigreet.nix)
    # (flakeStoreRoot + /nixos/sessions/wm/hyprland.nix)
    # (flakeStoreRoot + /nixos/sessions/wm/niri.nix)

    # nixos/SERVICES
    ##################
    (flakeStoreRoot + /nixos/services/monitoring/glances)
    # (flakeStoreRoot + /nixos/services/printing)
    # (flakeStoreRoot + /nixos/services/remap/keyd.nix)
    (flakeStoreRoot + /nixos/services/remap/makima.nix)
    (flakeStoreRoot + /nixos/services/ssh/keyAuth.nix)
    (flakeStoreRoot + /nixos/services/ssh/openssh.nix)
    # (flakeStoreRoot + /nixos/services/streaming/airplay.nix)
    # (flakeStoreRoot + /nixos/services/streaming/sunshine.nix)
    # (flakeStoreRoot + /nixos/services/virt/distrobox.nix)
    # (flakeStoreRoot + /nixos/services/virt/podman.nix)
    # (flakeStoreRoot + /nixos/services/vpn/easyroam.nix)
    # (flakeStoreRoot + /nixos/services/vpn/eduvpn.nix)
    (flakeStoreRoot + /nixos/services/vpn/netbird/server.nix)
    # (flakeStoreRoot + /nixos/services/vpn/tailscale)
    # (flakeStoreRoot + /nixos/services/vpn/tailscale/exit-node-server.nix # conflicts with netbird/server.nix)
    (flakeStoreRoot + /nixos/services/vpn/tailscale/subnet-router.nix)
    # (flakeStoreRoot + /nixos/services/vpn/tailscale/taildrive.nix)

    # nixos/PROGRAMS
    ##################
    (flakeStoreRoot + /nixos/programs/cli)
    (flakeStoreRoot + /nixos/programs/cli/shell/fish.nix)
    (flakeStoreRoot + /nixos/programs/cli/shell/starship.nix)

    # (flakeStoreRoot + /nixos/programs/gui/others)
    # (flakeStoreRoot + /nixos/programs/gui/others/activitywatch.nix)
    # (flakeStoreRoot + /nixos/programs/gui/terminal/foot.nix)
    # (flakeStoreRoot + /nixos/programs/gui/browser/firefox.nix)
    # (flakeStoreRoot + /nixos/programs/gui/mail/thunderbird.nix)
    # (flakeStoreRoot + /nixos/programs/gui/passwordmanager/bitwarden.nix)
    # (flakeStoreRoot + /nixos/programs/gui/passwordmanager/ente-auth.nix)
    # (flakeStoreRoot + /nixos/programs/gui/virtualization/virt-manager.nix)
    # (flakeStoreRoot + /nixos/programs/gui/virtualization/waydroid.nix)
    # (flakeStoreRoot + /nixos/programs/gui/office/libreoffice.nix)
    # (flakeStoreRoot + /nixos/programs/gui/fonts)
    # (flakeStoreRoot + /nixos/programs/gui/cursors)
    # (flakeStoreRoot + /nixos/programs/gui/desktop-shell/quickshell.nix)
    # (flakeStoreRoot + /nixos/programs/gui/desktop-shell/ignis.nix)

    # nixos/DEVELOPMENT
    #####################
    # (flakeStoreRoot + /nixos/development/langs/default-lsps.nix)
    # (flakeStoreRoot + )

    # devtools
    #####################
    (flakeStoreRoot + /nixos/development/tools/jj.nix)
    (flakeStoreRoot + /nixos/development/tools/direnv.nix)

    # games
    #####################
    # (flakeStoreRoot + /nixos/programs/gui/games/minecraft.nix)
  ];
}
