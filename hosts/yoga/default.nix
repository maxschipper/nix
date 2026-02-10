{ flakeStoreRoot, ... }:
{
  networking.hostName = "yoga";
  imports = [
    ./configuration.nix
    ./disko.nix
    ./hardware-configuration.nix

    # SCRIPTS
    #########
    (flakeStoreRoot + /scripts/nb-status.nix)

    # nixos/SYSTEM
    ################
    (flakeStoreRoot + /nixos/system/kernel/latest.nix)
    #(flakeStoreRoot + /nixos/system/kernel/zen.nix)
    (flakeStoreRoot + /nixos/system/kernel/params/yoga.nix)

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
    (flakeStoreRoot + /nixos/system/nix/nix-ld.nix)
    (flakeStoreRoot + /nixos/system/nix/nix-lsps.nix)
    (flakeStoreRoot + /nixos/system/nix/nixos-cli.nix)
    (flakeStoreRoot + /nixos/system/nix/rippkgs.nix)
    (flakeStoreRoot + /nixos/system/power)
    # (flakeStoreRoot + /nixos/system/security/nitrokey.nix)
    (flakeStoreRoot + /nixos/system/security/sops-nix.nix)
    (flakeStoreRoot + /nixos/system/security/tpm.nix)
    (flakeStoreRoot + /nixos/system/tty/tty.nix)
    (flakeStoreRoot + /nixos/system/users/max)
    (flakeStoreRoot + /nixos/system/xdg/baseDirSpec)
    (flakeStoreRoot + /nixos/system/xdg/defaultApps.nix)

    # nixos/SESSIONS
    ##################
    (flakeStoreRoot + /nixos/sessions/dm/ly.nix)
    # (flakeStoreRoot + /nixos/sessions/dm/greetd/tuigreet.nix)
    # (flakeStoreRoot + /nixos/sessions/wm/hyprland)
    (flakeStoreRoot + /nixos/sessions/wm/wayland/niri)

    # nixos/SERVICES
    ##################

    (flakeStoreRoot + /nixos/services/homelab/monitoring/prometheus/exporters/node/external.nix)
    (flakeStoreRoot + /nixos/services/printing)
    (flakeStoreRoot + /nixos/services/remap/keyd.nix)
    (flakeStoreRoot + /nixos/services/remap/makima.nix)
    (flakeStoreRoot + /nixos/services/ssh/keyAuth.nix)
    (flakeStoreRoot + /nixos/services/ssh/openssh.nix)
    (flakeStoreRoot + /nixos/services/streaming/airplay.nix)
    (flakeStoreRoot + /nixos/services/streaming/sunshine.nix)
    (flakeStoreRoot + /nixos/services/virt/distrobox.nix)
    (flakeStoreRoot + /nixos/services/virt/podman.nix)
    (flakeStoreRoot + /nixos/services/vpn/easyroam.nix)
    # (flakeStoreRoot + /nixos/services/vpn/eduvpn.nix)
    (flakeStoreRoot + /nixos/services/vpn/netbird/client.nix)
    # (flakeStoreRoot + /nixos/services/vpn/tailscale)
    # (flakeStoreRoot + /nixos/services/vpn/tailscale/exit-node-client.nix)
    # (flakeStoreRoot + /nixos/services/vpn/tailscale/taildrive.nix)
    (flakeStoreRoot + /nixos/system/sensors/iio.nix)

    # nixos/PROGRAMS
    ##################
    (flakeStoreRoot + /nixos/programs/laptop)
    # (flakeStoreRoot + /nixos/programs/flatpak)

    (flakeStoreRoot + /nixos/programs/cli)
    (flakeStoreRoot + /nixos/programs/cli/others/gemini.nix)
    (flakeStoreRoot + /nixos/programs/cli/shell/fish.nix)
    (flakeStoreRoot + /nixos/programs/cli/shell/starship.nix)
    (flakeStoreRoot + /nixos/programs/cli/llm/lmstudio)
    # (flakeStoreRoot + /nixos/programs/cli/llm/opencode)

    (flakeStoreRoot + /nixos/programs/cli/scripts/battery-conservation.nix)

    (flakeStoreRoot + /nixos/programs/gui/3d/freecad.nix)
    (flakeStoreRoot + /nixos/programs/gui/3d/openscad.nix)
    (flakeStoreRoot + /nixos/programs/gui/3d/orcaslicer.nix)
    (flakeStoreRoot + /nixos/programs/gui/audio)
    (flakeStoreRoot + /nixos/programs/gui/browser/chromium.nix)
    (flakeStoreRoot + /nixos/programs/gui/browser/firefox.nix)
    (flakeStoreRoot + /nixos/programs/gui/browser/qute.nix)
    (flakeStoreRoot + /nixos/programs/gui/cursors)
    (flakeStoreRoot + /nixos/programs/gui/editor/zed.nix)
    (flakeStoreRoot + /nixos/programs/gui/fonts)
    (flakeStoreRoot + /nixos/programs/gui/fonts/ibm-plex-mono.nix)
    (flakeStoreRoot + /nixos/programs/gui/fonts/iosevka.nix)
    (flakeStoreRoot + /nixos/programs/gui/mail/thunderbird.nix)
    # (flakeStoreRoot + /nixos/programs/gui/office/libreoffice.nix)
    (flakeStoreRoot + /nixos/programs/gui/others)
    (flakeStoreRoot + /nixos/programs/gui/others/activitywatch.nix)
    (flakeStoreRoot + /nixos/programs/gui/others/desktop-apps.nix)
    # (flakeStoreRoot + /nixos/programs/gui/others/livebook.nix)
    (flakeStoreRoot + /nixos/programs/gui/others/moonlight.nix)
    (flakeStoreRoot + /nixos/programs/gui/passwordmanager/bitwarden.nix)
    (flakeStoreRoot + /nixos/programs/gui/passwordmanager/ente-auth.nix)
    (flakeStoreRoot + /nixos/programs/gui/terminal/foot.nix)
    (flakeStoreRoot + /nixos/programs/gui/virtualization/virt-manager.nix)
    # (flakeStoreRoot + /nixos/programs/gui/virtualization/waydroid.nix)

    # (flakeStoreRoot + /nixos/programs/gui/desktop-shell/quickshell.nix)
    # (flakeStoreRoot + /nixos/programs/gui/desktop-shell/ignis.nix)

    # development/langs
    #####################
    (flakeStoreRoot + /nixos/development/langs/default-lsps.nix)
    (flakeStoreRoot + /nixos/development/langs/typst)
    (flakeStoreRoot + /nixos/development/langs/fish)
    (flakeStoreRoot + /nixos/development/langs/python)
    (flakeStoreRoot + /nixos/development/langs/typescript/bun.nix)

    # development/tools
    #####################
    (flakeStoreRoot + /nixos/development/tools/jj.nix)
    (flakeStoreRoot + /nixos/development/tools/direnv.nix)
    (flakeStoreRoot + /nixos/development/tools/jq.nix)

    # games
    #####################
    (flakeStoreRoot + /nixos/programs/gui/games/minecraft.nix)

    (flakeStoreRoot + /nixos/services/homelab/caddy/tls-cert/trust.nix)
  ];
}
