{
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
    ../../modules/system/audio
    ../../modules/system/localization
    ../../modules/system/users/max.nix
    ../../modules/system/security/nitrokey.nix
    ../../modules/system/security/tpm.nix
    ../../modules/system/power
    ../../modules/system/env-vars/xdg.nix
    ../../modules/system/tty/tty.nix

    # modules/SESSIONS
    ##################
    ../../modules/sessions/dm/ly.nix
    # ../../modules/sessions/dm/greetd/tuigreet.nix
    # ../../modules/sessions/wm/hyprland.nix
    ../../modules/sessions/wm/niri.nix

    # modules/SERVICES
    ##################
    ../../modules/services/vpn/tailscale
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
    ../../modules/programs/cli
    ../../modules/programs/cli/shell/fish.nix
    ../../modules/programs/laptop
    # ../../modules/programs/flatpak

    ../../modules/programs/gui/others
    ../../modules/programs/gui/others/activitywatch.nix
    ../../modules/programs/gui/others/livebook.nix
    ../../modules/programs/gui/terminal/foot.nix
    ../../modules/programs/gui/browser/chromium.nix
    ../../modules/programs/gui/browser/firefox.nix
    ../../modules/programs/gui/mail/thunderbird.nix
    ../../modules/programs/gui/passwordmanager/bitwarden.nix
    ../../modules/programs/gui/passwordmanager/ente-auth.nix
    ../../modules/programs/gui/virtualization/virt-manager.nix
    # ../../modules/programs/gui/virtualization/waydroid.nix
    ../../modules/programs/gui/office/libreoffice.nix
    ../../modules/programs/gui/fonts
    ../../modules/programs/gui/cursors
    ../../modules/programs/gui/3d/orcaslicer.nix
    ../../modules/programs/gui/3d/freecad.nix
    ../../modules/programs/gui/3d/openscad.nix

    # ../../modules/programs/gui/desktop-shell/quickshell.nix
    # ../../modules/programs/gui/desktop-shell/ignis.nix

    # modules/DEVELOPMENT
    #####################
    ../../modules/development/lsps
    ../../modules/development/typst.nix

    # devtools
    #####################
    ../../modules/development/tools/jj.nix
    ../../modules/development/tools/direnv.nix

    # games
    #####################
    ../../modules/programs/gui/games/minecraft.nix

    ../../modules/services/homelab/caddy/tls-cert/trust.nix
  ];
  networking.hostName = "yoga";
}
