{ pkgs, ... }:
{
  imports = [
    ../.common-wayland.nix
    ./niri-xdg-portals.nix

    ./niri-systemd-services/foot-server.nix
    ./niri-systemd-services/polkit-gnome.nix
    ./niri-systemd-services/sunsetr.nix
    ./niri-systemd-services/swayidle.nix
    ./niri-systemd-services/swaync.nix
    ./niri-systemd-services/swayosd.nix
    ./niri-systemd-services/swww.nix
    ./niri-systemd-services/waybar.nix
  ];

  programs.niri = {
    enable = true;
    useNautilus = true;
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.iio-niri.enable = false; # sometimes flips output upside down after resume from hibernation
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    wl-clipboard
    libnotify

    capitaine-cursors
    nautilus
    fuzzel
    bemoji

    nwg-displays
    nwg-look
    blueman

    hyprpicker
    better-control

    # papirus-icon-theme
    # walker
    # libqalculate
    # zenity # gui for scripts, used by waybar-hotspot
  ];
}
