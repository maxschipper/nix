let
  domain = "nuc.lab";
in
{
  type = "monitor";
  hide-header = true;
  cache = "5s";
  title = "Services";
  # style = "compact";
  sites = [
    {
      title = "Gitea";
      url = "https://gitea.${domain}";
      icon = "sh:gitea";
      same-tab = true;
      timeout = "5s";
    }
    {
      title = "Paperless";
      url = "https://paperless.${domain}";
      icon = "sh:paperless-ngx";
      same-tab = true;
      timeout = "5s";
    }
    {
      title = "Immich";
      url = "https://immich.${domain}";
      icon = "sh:immich";
      same-tab = true;
      timeout = "5s";
    }
    {
      title = "WebDAV";
      url = "https://webdav.${domain}";
      # icon = "sh:file-station";
      same-tab = true;
      timeout = "5s";
      icon = "sh:filesync";
      alt-status-codes = [
        401
        207
      ];
      # basic-auth = {
      # username = "super-productivity";
      # password = "";
      # };
    }
    {
      title = "Adguard Home";
      url = "https://adguard.${domain}";
      icon = "sh:adguard-home";
      same-tab = true;
      timeout = "5s";
    }
    # {
    #   title = "Stirling PDF";
    #   url = "https://pdf.${domain}";
    #   icon = "sh:stirling-pdf";
    #   same-tab = true;
    #   timeout = "5s";
    # }
  ];
}
