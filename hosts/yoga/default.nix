{
  networking.hostName = "yoga";
  imports = [
    ./configuration.nix
    ./disko.nix
    ./hardware-configuration.nix

    # modules/SYSTEM
    ################
    ../../modules/system/kernel/latest.nix
    # ../../modules/system/kernel/zen.nix
    ../../modules/system/kernel/params/yoga.nix

    ../../modules/system/bootloader/systemd.nix
    ../../modules/system/initrd/systemd.nix
    # ../../modules/system/initrd/luks-fido2.nix

    ../../modules/system/networking/networkmanager.nix
    ../../modules/system/networking/resolved.nix
    ../../modules/system/networking/bluetooth.nix
    ../../modules/system/nix
    ../../modules/system/nix/comma.nix
    ../../modules/system/nix/nh.nix
    ../../modules/system/nix/nixos-cli.nix
    ../../modules/system/nix/nix-lsps.nix
    ../../modules/system/nix/nix-ld.nix
    ../../modules/system/nix/rippkgs.nix
    ../../modules/system/audio
    ../../modules/system/localization
    ../../modules/system/users/max.nix
    ../../modules/system/security/sops-nix.nix
    # ../../modules/system/security/nitrokey.nix
    ../../modules/system/security/tpm.nix
    ../../modules/system/power
    ../../modules/system/tty/tty.nix
    ../../modules/system/xdg/baseDirSpec
    ../../modules/system/xdg/defaultApps.nix

    # modules/SESSIONS
    ##################
    ../../modules/sessions/dm/ly.nix
    # ../../modules/sessions/dm/greetd/tuigreet.nix
    # ../../modules/sessions/wm/hyprland.nix
    ../../modules/sessions/wm/niri.nix

    # modules/SERVICES
    ##################
    ../../modules/services/vpn/netbird/client.nix

    # ../../modules/services/vpn/tailscale
    # ../../modules/services/vpn/tailscale/exit-node-client.nix
    # ../../modules/services/vpn/tailscale/taildrive.nix
    # ../../modules/services/vpn/eduvpn.nix
    ../../modules/services/vpn/easyroam.nix
    ../../modules/services/remap/keyd.nix
    ../../modules/services/remap/makima.nix
    ../../modules/services/printing
    #  ../../modules/services/ssh/openssh.nix
    ../../modules/services/streaming/airplay.nix
    ../../modules/services/streaming/sunshine.nix
    ../../modules/services/virt/podman.nix
    ../../modules/services/virt/distrobox.nix
    ../../modules/system/sensors/iio.nix

    # modules/PROGRAMS
    ##################
    ../../modules/programs/laptop
    # ../../modules/programs/flatpak

    ../../modules/programs/cli
    ../../modules/programs/cli/others/gemini.nix
    ../../modules/programs/cli/shell/fish.nix
    ../../modules/programs/cli/shell/starship.nix
    ../../modules/programs/cli/llm/lmstudio
    # ../../modules/programs/cli/llm/opencode

    ../../modules/programs/cli/scripts/battery-conservation.nix

    ../../modules/programs/gui/others
    ../../modules/programs/gui/others/activitywatch.nix
    ../../modules/programs/gui/others/moonlight.nix
    # ../../modules/programs/gui/others/livebook.nix
    ../../modules/programs/gui/terminal/foot.nix
    ../../modules/programs/gui/browser/chromium.nix
    ../../modules/programs/gui/browser/firefox.nix
    ../../modules/programs/gui/editor/zed.nix
    ../../modules/programs/gui/mail/thunderbird.nix
    ../../modules/programs/gui/passwordmanager/bitwarden.nix
    ../../modules/programs/gui/passwordmanager/ente-auth.nix
    ../../modules/programs/gui/virtualization/virt-manager.nix
    # ../../modules/programs/gui/virtualization/waydroid.nix
    # ../../modules/programs/gui/office/libreoffice.nix
    ../../modules/programs/gui/fonts
    ../../modules/programs/gui/fonts/iosevka.nix
    ../../modules/programs/gui/fonts/ibm-plex-mono.nix
    ../../modules/programs/gui/cursors
    ../../modules/programs/gui/3d/orcaslicer.nix
    ../../modules/programs/gui/3d/freecad.nix
    ../../modules/programs/gui/3d/openscad.nix

    # ../../modules/programs/gui/desktop-shell/quickshell.nix
    # ../../modules/programs/gui/desktop-shell/ignis.nix

    # development/langs
    #####################
    ../../modules/development/port5432.nix
    ../../modules/development/langs/default-lsps.nix
    ../../modules/development/langs/typst
    ../../modules/development/langs/fish
    ../../modules/development/langs/python
    ../../modules/development/langs/typescript/bun.nix

    # development/tools
    #####################
    ../../modules/development/tools/jj.nix
    ../../modules/development/tools/direnv.nix
    ../../modules/development/tools/jq.nix

    # games
    #####################
    ../../modules/programs/gui/games/minecraft.nix

    ../../modules/services/homelab/caddy/tls-cert/trust.nix
  ];
}
