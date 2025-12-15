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
    }
    {
      title = "Paperless";
      url = "https://paperless.${domain}";
      icon = "sh:paperless-ngx";
    }
    {
      title = "Immich";
      url = "https://immich.${domain}";
      icon = "sh:immich";
    }
    {
      title = "WebDAV";
      url = "https://webdav.${domain}";
      # icon = "sh:file-station";
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
    }
    # {
    #   title = "Stirling PDF";
    #   url = "https://pdf.${domain}";
    #   icon = "sh:stirling-pdf";
    # }
  ];
}
