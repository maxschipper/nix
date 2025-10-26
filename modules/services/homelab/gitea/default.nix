{
  services.gitea = {
    enable = true;
    appName = "🍵 gitea";
    settings = {
      server.DOMAIN = "gitea.nuc.lab";
      # server.ROOT_URL = "http://nuc.tail3035bf.ts.net";
      repository = {
        ENABLE_PUSH_CREATE_USER = true;
        DEFAULT_PUSH_CREATE_PRIVATE = false;

      };
      "repository.upload" = {
        FILE_MAX_SIZE = 500;
        MAX_FILES = 50;
      };
      service = {
        DISABLE_REGISTRATION = true;
      };
      ui = {
        SHOW_USER_EMAIL = false;
      };

      # "cron.sync_external_users" = {
      #   RUN_AT_START = true;
      #   SCHEDULE = "@every 24h";
      #   UPDATE_EXISTING = true;
      # };
      # mailer = {
      #   ENABLED = true;
      #   MAILER_TYPE = "sendmail";
      #   FROM = "do-not-reply@example.org";
      #   SENDMAIL_PATH = "${pkgs.system-sendmail}/bin/sendmail";
      # };
      other = {
        SHOW_FOOTER_VERSION = false;
      };
    };
  };
}
