{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.ungoogled-chromium
    # pkgs.chromium
  ];

  programs.chromium = {
    enable = false;
    extraOpts = {
      "BrowserSignin" = 0;
      "SyncDisabled" = true;
      "PasswordManagerEnabled" = false;
      "SpellcheckEnabled" = false;
    };
    extensions = [
      "ocaahdebbfolfmndjeplogmgcagdmblk;https://github.com/NeverDecaf/chromium-web-store/blob/c3c5f43e0b0ad57c4f73c5ae27c43cb69cf777f2/updates.xml" # chrome web store for chromium
      # "ddkjiahejlhfcafbddmgiahcphecmpfh" # ublock origin lite
      # "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
    ];
  };
}
