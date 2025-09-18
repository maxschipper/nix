{ pkgs, ... }:
{
  # environment.systemPackages = [
  # pkgs.ungoogled-chromium
  # ];
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;

    extraOpts = {
      "BrowserSignin" = 0;
      "SyncDisabled" = true;
      "PasswordManagerEnabled" = false;
      "SpellcheckEnabled" = false;
    };
  };
}
