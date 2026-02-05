{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.homelab.services.adguard-exporter;
  cfgAdguard = config.homelab.services.adguard;

  adguard-exporter = pkgs.stdenv.mkDerivation rec {
    pname = "adguard-exporter";
    version = "1.2.1";

    src = pkgs.fetchurl {
      url = "https://github.com/henrywhitaker3/adguard-exporter/releases/download/v${version}/adguard-exporter_${version}_linux_amd64.tar.gz";
      sha256 = "sha256-anaNaItwS/oTBDzGDXqbENbQnkBnLkI7b0yxmKhU1aE=";
    };

    sourceRoot = ".";
    installPhase = ''
      install -m755 -D adguard-exporter $out/bin/adguard-exporter
    '';
  };
in
{
  systemd.services.adguard-exporter = lib.mkIf (cfg.enable && cfgAdguard.enable) {
    description = "AdGuard Home Prometheus Exporter";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStart = "${adguard-exporter}/bin/adguard-exporter";
      Restart = "always";

      Environment = [
        "ADGUARD_SERVERS=${cfgAdguard.url}"
        "ADGUARD_USERNAMES=not_needed"
        "ADGUARD_PASSWORDS=not_needed"
        # "INTERVAL=30s"
        # "DEBUG="
        "BIND_ADDR=${cfg.ip}:${toString cfg.port}"
      ];

      DynamicUser = true;
      User = "adguard-exporter";
      Group = "adguard-exporter";

      ProtectSystem = "full";
      DeviceAllow = "";

      ProtectHome = true; # /home, /root, /run/user are inaccessible
      PrivateTmp = true;
      PrivateDevices = true; # No access to hardware devices (/dev)
      ProtectKernelTunables = true;
      ProtectKernelModules = true;
      ProtectControlGroups = true;
      RestrictSUIDSGID = true;

      RestrictAddressFamilies = [
        "AF_INET"
        # "AF_INET6"
      ];

      CapabilityBoundingSet = ""; # Drop ALL capabilities (root powers)
      NoNewPrivileges = true; # Prevent elevating privileges later

      SystemCallFilter = [ "@system-service" ];
      SystemCallErrorNumber = "EPERM";

      LockPersonality = true; # Prevent kernel architecture emulation
      MemoryDenyWriteExecute = true; # Prevent creating executable memory (anti-exploit)
      RemoveIPC = true; # Clean up IPC objects on stop
    };
  };
}
