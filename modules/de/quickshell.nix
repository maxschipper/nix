{
  pkgs,
  quickshell,
  caelestia-cli,
  caelestia-shell,
  ...
}:
{
  environment.systemPackages = [
    quickshell.packages.${pkgs.system}.default
    caelestia-cli.packages.${pkgs.system}.default
    caelestia-shell.packages.${pkgs.system}.default

    # noctalia deps
    # pkgs.material-symbols
    pkgs.cava
    pkgs.wallust

    # cae deps
    pkgs.material-symbols
    pkgs.inotify-tools

    # Dependencies:

    #     caelestia-cli
    #     quickshell-git - this has to be the git version, not the latest tagged version
    #     ddcutil
    #     brightnessctl
    #     app2unit
    #     cava
    #     networkmanager
    #     lm-sensors
    #     fish
    #     aubio
    #     libpipewire
    #     glibc
    #     qt6-declarative
    #     gcc-libs
    #     material-symbols
    #     jetbrains-mono-nerd
    #     grim
    #     swappy
    #     libqalculate
  ];

}
