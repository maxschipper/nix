{ pkgs, ... }:
{
  imports = [
    ./podman.nix
  ];

  environment.systemPackages = [
    pkgs.distrobox
    pkgs.distrobox-tui
  ];

  # "potentially insufficient UIDs and GUIDs" error
  # Rebuild your system, run podman system migrate, and try creating the distrobox container again.
  #   users.users.YOURUSERNAME = {
  #     extraGroups = [ "podman" ];
  #     subGidRanges = [
  #         {
  #             count = 65536;
  #             startGid = 1000;
  #         }
  #     ];
  #     subUidRanges = [
  #         {
  #             count = 65536;
  #             startUid = 1000;
  #         }
  #     ];
  # };

}
