{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    inputs.quickshell.packages.${pkgs.system}.default
    inputs.caelestia-cli.packages.${pkgs.system}.default
    inputs.caelestia-shell.packages.${pkgs.system}.default

    # noctalia deps
    pkgs.cava
    pkgs.wallust

    # cae deps
    pkgs.material-symbols
    pkgs.inotify-tools
    pkgs.libqalculate

    # Dependencies:

    #     caelestia-cli
    #     quickshell-git - this has to be the git version, not the latest tagged version
    #     ddcutil
    #     brightnessctl
    #     app2unit
    #     cava
    #     networkmanager
    #     lm-sensors
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
