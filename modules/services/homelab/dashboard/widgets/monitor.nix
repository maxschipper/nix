{
  type = "monitor";
  hide-header = true;
  cache = "1m";
  title = "Services";
  # style = "compact";
  sites = [
    {
      title = "Gitea";
      url = "https://gitea.nuc.lab";
      icon = "sh:gitea";
    }
    {
      title = "Paperless";
      url = "https://paperless.nuc.lab";
      icon = "sh:paperless-ngx";
    }
    {
      title = "Immich";
      url = "https://immich.nuc.lab";
      icon = "sh:immich";
    }
    {
      title = "WebDAV";
      url = "https://webdav.nuc.lab";
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
      url = "https://adguard.nuc.lab";
      icon = "sh:adguard-home";
    }
    # {
    #   title = "Stirling PDF";
    #   url = "https://pdf.nuc.lab";
    #   icon = "sh:stirling-pdf";
    # }
  ];
}
