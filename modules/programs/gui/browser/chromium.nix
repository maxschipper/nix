{ pkgs, ... }:
{
  environment.systemPackages = [
    # pkgs.ungoogled-chromium
    pkgs.chromium
  ];

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
  #     "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
  #   ];
  # };
}
