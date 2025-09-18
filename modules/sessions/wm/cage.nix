{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.cage
  ];
  services.cage = {
    enable = true;
    user = "max";
    #    program = "${pkgs.chromium}/bin/chromium https://FOOBAR.COM/ --kiosk --lang=de --enable-extensions --noerrdialogs --no-first-run";
    # program = "${pkgs.chromium}/bin/chromium --lang=de --noerrdialogs --no-first-run";
    program = "${pkgs.chromium}/bin/chromium --noerrdialogs --no-first-run";
  };
}
