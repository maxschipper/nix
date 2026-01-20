{
  networking.hostName = "nuc";
  imports = [
    ../../modules/services/homelab

    ../../modules/services/homelab/dashboard/glance.nix
    ../../modules/services/homelab/paperless
    ../../modules/services/homelab/git/gitea
    # ../../modules/services/homelab/ttyd/btop.nix
    ../../modules/services/homelab/caddy
    ../../modules/services/homelab/caddy/tls-cert/trust.nix
    # ../../modules/services/homelab/dns/core-dns
    ../../modules/services/homelab/dns/adguardhome
    # ../../modules/services/homelab/pdf/stirling-pdf.nix
    ../../modules/services/homelab/immich
    ../../modules/services/homelab/home-assistant
    ../../modules/services/homelab/music/navidrome.nix
    ../../modules/services/homelab/music/lidarr.nix
    ../../modules/services/homelab/music/deemix.nix

    ../../modules/services/homelab/webdav

    ../../modules/services/homelab/monitoring/grafana
    ../../modules/services/homelab/monitoring/prometheus
    ../../modules/services/homelab/monitoring/prometheus/exporters/node.nix
    ../../modules/services/homelab/monitoring/prometheus/exporters/smart.nix

    ../../modules/programs/gui/browser/chromium.nix
    # ../../modules/sessions/wm/cage/youtube.nix

    ../../modules/sessions/wm/xserver
    ../../modules/sessions/wm/xserver/matchbox.nix
    ../../modules/sessions/wm/xserver/xob.nix

    ############################################
    ############################################
    ############################################
    ############################################
    ./configuration.nix
    ./hardware-configuration.nix

    # modules/SYSTEM
    ################
    ../../modules/system/kernel/latest.nix
    # ../../modules/system/kernel/zen.nix
    ../../modules/system/kernel/params/nuc.nix

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
    # ../../modules/system/nix/nix-ld.nix
    ../../modules/system/audio
    ../../modules/system/localization
    ../../modules/system/users/max.nix
    # ../../modules/system/security/nitrokey.nix
    # ../../modules/system/security/tpm.nix
    ../../modules/system/security/sops-nix.nix
    # ../../modules/system/power
    ../../modules/system/xdg/baseDirSpec

    # modules/SESSIONS
    ##################
    # ../../modules/sessions/dm/ly.nix
    # ../../modules/sessions/dm/greetd/tuigreet.nix
    # ../../modules/sessions/wm/hyprland.nix
    # ../../modules/sessions/wm/niri.nix

    # modules/SERVICES
    ##################
    ../../modules/services/vpn/netbird/server.nix

    # ../../modules/services/vpn/tailscale
    ../../modules/services/vpn/tailscale/subnet-router.nix
    # ../../modules/services/vpn/tailscale/exit-node-server.nix # conflicts with netbird/server.nix
    # ../../modules/services/vpn/tailscale/taildrive.nix
    # ../../modules/services/vpn/eduvpn.nix
    # ../../modules/services/vpn/easyroam.nix
    ../../modules/services/remap/keyd.nix
    ../../modules/services/remap/makima.nix
    # ../../modules/services/printing
    ../../modules/services/ssh/openssh.nix
    # ../../modules/services/streaming/airplay.nix
    # ../../modules/services/streaming/sunshine.nix
    # ../../modules/services/virt/podman.nix
    # ../../modules/services/virt/distrobox.nix

    # modules/PROGRAMS
    ##################
    ../../modules/programs/cli
    ../../modules/programs/cli/shell/fish.nix
    ../../modules/programs/cli/shell/starship.nix

    # ../../modules/programs/gui/others
    # ../../modules/programs/gui/others/activitywatch.nix
    # ../../modules/programs/gui/terminal/foot.nix
    # ../../modules/programs/gui/browser/firefox.nix
    # ../../modules/programs/gui/mail/thunderbird.nix
    # ../../modules/programs/gui/passwordmanager/bitwarden.nix
    # ../../modules/programs/gui/passwordmanager/ente-auth.nix
    # ../../modules/programs/gui/virtualization/virt-manager.nix
    # ../../modules/programs/gui/virtualization/waydroid.nix
    # ../../modules/programs/gui/office/libreoffice.nix
    # ../../modules/programs/gui/fonts
    # ../../modules/programs/gui/cursors
    # ../../modules/programs/gui/desktop-shell/quickshell.nix
    # ../../modules/programs/gui/desktop-shell/ignis.nix

    # modules/DEVELOPMENT
    #####################
    ../../modules/development/lsps
    # ../../modules/development/typst.nix

    # devtools
    #####################
    ../../modules/development/tools/jj.nix
    ../../modules/development/tools/direnv.nix

    # games
    #####################
    # ../../modules/programs/gui/games/minecraft.nix
  ];
}
