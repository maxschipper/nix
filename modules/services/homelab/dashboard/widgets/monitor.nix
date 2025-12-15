let
  domain = "nuc.lab";
in
{
  type = "monitor";
  hide-header = true;
  # cache = "1m";
  title = "Services";
  # style = "compact";
  sites = [
    {
      title = "Gitea";
      url = "https://gitea.${domain}";
      icon = "sh:gitea";
      same-tab = true;
    }
    {
      title = "Paperless";
      url = "https://paperless.${domain}";
      icon = "sh:paperless-ngx";
      same-tab = true;
    }
    {
      title = "Immich";
      url = "https://immich.${domain}";
      icon = "sh:immich";
      same-tab = true;
    }
    {
      title = "WebDAV";
      url = "https://webdav.${domain}";
      # icon = "sh:file-station";
      same-tab = true;
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
    }
    # {
    #   title = "Stirling PDF";
    #   url = "https://pdf.${domain}";
    #   icon = "sh:stirling-pdf";
    #   same-tab = true;
    # }
  ];
}
