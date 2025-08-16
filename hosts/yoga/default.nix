{
  imports = [
    ./configuration.nix
    ./disko.nix
    ./hardware-configuration.nix

    # modules/SYSTEM
    ################
    ../../modules/system/kernel/latest.nix
    ../../modules/system/kernel/kernelParams.nix

    ../../modules/system/bootloader/systemd.nix
    ../../modules/system/initrd/systemd.nix
    # ../../modules/system/initrd/luks-fido2.nix

    ../../modules/system/networking/networkmanager.nix
    ../../modules/system/nix
    ../../modules/system/audio
    # ../../modules/system/audio/fixAudio.nix # doesnt work i run the script from hyprland
    ../../modules/system/localization
    ../../modules/system/users/max.nix
    ../../modules/system/security/nitrokey.nix

    # modules/SESSIONS
    ##################
    ../../modules/sessions/dm/ly.nix
    ../../modules/sessions/wm/hyprland.nix

    # modules/SERVICES
    ##################
    ../../modules/services/tailscale
    ../../modules/services/keyd
    # ../../modules/services/ssh/openssh.nix

    # modules/PROGRAMS
    ##################
    ../../modules/programs/cli/shell/fish.nix

    ../../modules/programs/laptop
    ../../modules/programs/quickshell

    ../../modules/programs/cli

    ../../modules/programs/gui/others
    ../../modules/programs/gui/terminal/foot.nix
    ../../modules/programs/gui/browser/chromium.nix
    ../../modules/programs/gui/browser/firefox.nix
    ../../modules/programs/gui/mail/thunderbird.nix
    ../../modules/programs/gui/passwordmanager/bitwarden.nix
    ../../modules/programs/gui/virtualization/virt-manager.nix
    ../../modules/programs/gui/fonts
    ../../modules/programs/gui/cursors

    # modules/DEVELOPMENT
    #####################
    ../../modules/development/lsps
    ../../modules/development/typst.nix

  ];
}
