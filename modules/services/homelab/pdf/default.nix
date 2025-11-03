{
  services.stirling-pdf = {
    enable = true;
    environment = {
      SERVER_PORT = 8592;
      # INSTALL_BOOK_AND_ADVANCED_HTML_OPS = "true";
      LEGAL_TERMSANDCONDITIONS = "";
      LEGAL_PRIVACYPOLICY = "";
      SYSTEM_DEFAULTLOCALE = "de-DE";
      # UI_APPNAME = "";
      UI_LANGUAGES = ''["de-DE","en-US"]'';
    };
  };
}
