{ inputs, ... }:
{
  imports = [ inputs.disko.nixosModules.disko ];

  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-eui.002538f550ba6ec1";
        content = {
          type = "gpt";
          partitions = {
            # EFI System Partition
            ESP = {
              size = "1G"; # a little more than needed but nixos generations could fill it up and cause issues i think
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            # A single LUKS partition taking up the rest of the disk
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings = {
                  # Good practice for SSDs
                  allowDiscards = true;
                };
                content = {
                  type = "btrfs";
                  extraArgs = [
                    "-f"
                    "-L"
                    "nixos"
                  ]; # flags: overwrite if it exists + label nixos
                  subvolumes = {
                    "@root" = {
                      mountpoint = "/";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    # Subvolume for home directories
                    "@home" = {
                      mountpoint = "/home";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    # Subvolume for the Nix store
                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    # Subvolume for /var/log
                    "@log" = {
                      mountpoint = "/var/log";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };
                    # Subvolume to hold the swap file
                    "@swap" = {
                      mountpoint = "/.swapvol";
                      swap.swapfile.size = "34G"; # 34 to make sure REALLY everything fits
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
