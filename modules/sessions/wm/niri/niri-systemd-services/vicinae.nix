{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ vicinae ];

  systemd.user.targets.graphical-session.wants = [ "vicinae.service" ];

  nixpkgs.overlays = [
    (final: prev: {
      vicinae = prev.vicinae.overrideAttrs (old: {
        postFixup = ''
          substituteInPlace $out/share/systemd/user/vicinae.service \
            --replace-fail "/bin/kill" "${prev.coreutils}/bin/kill" \
            --replace-fail "ExecStart=vicinae" "ExecStart=$out/bin/vicinae"
        '';
      });
    })
  ];
}
