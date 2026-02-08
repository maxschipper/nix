{ flakeStoreRoot, ... }:
{
  networking.hostName = "nuc";
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./homelab.nix

    # modules/SYSTEM
    ################
    (flakeStoreRoot + /modules/system/kernel/latest.nix)
    # (flakeStoreRoot + /modules/system/kernel/zen.nix)
    (flakeStoreRoot + /modules/system/kernel/params/nuc.nix)

    (flakeStoreRoot + /modules/system/bootloader/systemd.nix)
    (flakeStoreRoot + /modules/system/initrd/systemd.nix)
    # (flakeStoreRoot + /modules/system/initrd/luks-fido2.nix)

    (flakeStoreRoot + /modules/system/networking/networkmanager.nix)
    (flakeStoreRoot + /modules/system/networking/resolved.nix)
    (flakeStoreRoot + /modules/system/networking/bluetooth.nix)
    (flakeStoreRoot + /modules/system/nix)
    (flakeStoreRoot + /modules/system/nix/comma.nix)
    (flakeStoreRoot + /modules/system/nix/nh.nix)
    (flakeStoreRoot + /modules/system/nix/nixos-cli.nix)
    (flakeStoreRoot + /modules/system/nix/nix-lsps.nix)
    # (flakeStoreRoot + /modules/system/nix/nix-ld.nix)
    (flakeStoreRoot + /modules/system/audio)
    (flakeStoreRoot + /modules/system/localization)
    (flakeStoreRoot + /modules/system/users/max)
    # (flakeStoreRoot + /modules/system/security/nitrokey.nix)
    # (flakeStoreRoot + /modules/system/security/tpm.nix)
    (flakeStoreRoot + /modules/system/security/sops-nix.nix)
    # (flakeStoreRoot + /modules/system/power # (laptop specific))
    (flakeStoreRoot + /modules/system/xdg/baseDirSpec)

    # modules/SESSIONS
    ##################
    # (flakeStoreRoot + /modules/sessions/dm/ly.nix)
    # (flakeStoreRoot + /modules/sessions/dm/greetd/tuigreet.nix)
    # (flakeStoreRoot + /modules/sessions/wm/hyprland.nix)
    # (flakeStoreRoot + /modules/sessions/wm/niri.nix)

    # modules/SERVICES
    ##################
    (flakeStoreRoot + /modules/services/monitoring/glances)
    # (flakeStoreRoot + /modules/services/printing)
    (flakeStoreRoot + /modules/services/remap/keyd.nix)
    (flakeStoreRoot + /modules/services/remap/makima.nix)
    (flakeStoreRoot + /modules/services/ssh/keyAuth.nix)
    (flakeStoreRoot + /modules/services/ssh/openssh.nix)
    # (flakeStoreRoot + /modules/services/streaming/airplay.nix)
    # (flakeStoreRoot + /modules/services/streaming/sunshine.nix)
    # (flakeStoreRoot + /modules/services/virt/distrobox.nix)
    # (flakeStoreRoot + /modules/services/virt/podman.nix)
    # (flakeStoreRoot + /modules/services/vpn/easyroam.nix)
    # (flakeStoreRoot + /modules/services/vpn/eduvpn.nix)
    (flakeStoreRoot + /modules/services/vpn/netbird/server.nix)
    # (flakeStoreRoot + /modules/services/vpn/tailscale)
    # (flakeStoreRoot + /modules/services/vpn/tailscale/exit-node-server.nix # conflicts with netbird/server.nix)
    (flakeStoreRoot + /modules/services/vpn/tailscale/subnet-router.nix)
    # (flakeStoreRoot + /modules/services/vpn/tailscale/taildrive.nix)

    # modules/PROGRAMS
    ##################
    (flakeStoreRoot + /modules/programs/cli)
    (flakeStoreRoot + /modules/programs/cli/shell/fish.nix)
    (flakeStoreRoot + /modules/programs/cli/shell/starship.nix)

    # (flakeStoreRoot + /modules/programs/gui/others)
    # (flakeStoreRoot + /modules/programs/gui/others/activitywatch.nix)
    # (flakeStoreRoot + /modules/programs/gui/terminal/foot.nix)
    # (flakeStoreRoot + /modules/programs/gui/browser/firefox.nix)
    # (flakeStoreRoot + /modules/programs/gui/mail/thunderbird.nix)
    # (flakeStoreRoot + /modules/programs/gui/passwordmanager/bitwarden.nix)
    # (flakeStoreRoot + /modules/programs/gui/passwordmanager/ente-auth.nix)
    # (flakeStoreRoot + /modules/programs/gui/virtualization/virt-manager.nix)
    # (flakeStoreRoot + /modules/programs/gui/virtualization/waydroid.nix)
    # (flakeStoreRoot + /modules/programs/gui/office/libreoffice.nix)
    # (flakeStoreRoot + /modules/programs/gui/fonts)
    # (flakeStoreRoot + /modules/programs/gui/cursors)
    # (flakeStoreRoot + /modules/programs/gui/desktop-shell/quickshell.nix)
    # (flakeStoreRoot + /modules/programs/gui/desktop-shell/ignis.nix)

    # modules/DEVELOPMENT
    #####################
    # (flakeStoreRoot + /modules/development/langs/default-lsps.nix)
    # (flakeStoreRoot + )

    # devtools
    #####################
    (flakeStoreRoot + /modules/development/tools/jj.nix)
    (flakeStoreRoot + /modules/development/tools/direnv.nix)

    # games
    #####################
    # (flakeStoreRoot + /modules/programs/gui/games/minecraft.nix)
  ];
}
