{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.ungoogled-chromium ];

  # programs.chromium = {
  #   enable = true;
  #   extraOpts = {
  #     "BrowserSignin" = 0;
  #     "SyncDisabled" = true;
  #     "PasswordManagerEnabled" = false;
  #     "SpellcheckEnabled" = false;
  #   };
  #   extensions = [
  #     "ddkjiahejlhfcafbddmgiahcphecmpfh" # ublock origin lite
  #     "epcnnfbjfcgphgdmggkamkmgojdagdnn" # ublock origin
  #     "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
  #     "djflhoibgkdhkhhcedjiklpkjnoahfmg" # User-Agent Switcher for Chrome
  #   ];
  # };
}
