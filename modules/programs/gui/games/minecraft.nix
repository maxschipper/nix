{ pkgs, ... }:
{
  environment.systemPackages = [

    pkgs.prismlauncher

    # (pkgs.prismlauncher.override {
    #   additionalPrograms = [
    #     # pkgs.ffmpeg
    #   ]; # Additional programs that will be added to PATH
    #   additionalLibs = [ ]; # Additional libraries that will be added to LD_LIBRARY_PATH
    #   controllerSupport = false; # Turn on/off support for controllers on Linux. default: stdenv.hostPlatform.isLinux
    #   gamemodeSupport = true; # Turn on/off support for GameMode on Linux; default: stdenv.hostPlatform.isLinux

    #   jdks = [
    #     # pkgs.jdk21 # default
    #     # pkgs.jdk17 # default
    #     # pkgs.jdk8 # default

    #     # pkgs.graalvm-ce
    #     # pkgs.zulu8
    #     # pkgs.zulu17
    #     # pkgs.zulu
    #   ]; # Java runtimes that will be added to PRISMLAUNCHER_JAVA_PATHS and will be available to Prism Launcher
    # })

  ];
}
