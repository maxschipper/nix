{
  name = "all";
  columns = [
    {
      size = "small";
      widgets = [
        {
          type = "search";
          search-enging = "duckduckgo";
          autofocus = true;
        }
        {
          type = "monitor";
          cache = "5m";
          title = "Services";
          # style = "compact";
          sites = [
            {
              title = "Gitea";
              url = "https://gitea.nuc.lab";
              icon = "sh:gitea";
            }
            {
              title = "Gitea local";
              url = "http://localhost:3000";
              icon = "sh:gitea";
            }
            {
              title = "Paperless";
              url = "https://paperless.nuc.lab";
              icon = "sh:paperless-ngx";
            }
            {
              title = "Stirling PDF";
              url = "https://pdf.nuc.lab";
              icon = "sh:stirling-pdf";
            }
          ];
        }
        {
          type = "bookmarks";
          groups = [
            {
              title = "Uni";
              links = [
                {
                  title = "VC";
                  url = "https://google.com";
                }
              ];
            }
          ];
        }
        {
          type = "releases";
          show-source-icon = true;
          limit = 10;
          collapse-after = 5;
          repositories = [
            "YaLTeR/niri"
            "helix-editor/helix"
            # "go-gitea/gitea"
            # "glanceapp/glance"
          ];
        }
        # {
        #   type = "dns-stats";
        #   service = "adguard";
        #   url = "adguard.nuc.lab";
        #   username = "admin";
        #   password = "\${ADGUARD_PASSWORD}";
        #   hour-format = "24h";
        # }
        {
          type = "server-stats";
          servers = [
            {
              type = "local";
              hide-swap = true;
              hide-mountpoints-by-default = true;
              mountpoints = {
                "/" = {
                  name = "root";
                  hide = false;
                };
              };
            }
            {
              type = "remote";
              url = "http://100.78.152.127:27973";
              token = "8h8jBUG#Q34gsJ";
            }
          ];
        }
        {
          type = "markets";
          chart-link-template = "https://www.tradingview.com/chart/?symbol={SYMBOL}";
          symbol-link-template = "https://www.google.com/search?tbm=nws&q={SYMBOL}";
          markets = [
            {
              symbol = "SPY";
              name = "S&P 500";
            }
            {
              symbol = "BTC-EUR";
              name = "Bitcoin";
              chart-link = "https://www.tradingview.com/chart/?symbol=INDEX:BTCEUR";
            }
            {
              symbol = "NVDA";
              name = "NVIDIA";
            }
            {
              symbol = "AAPL";
              name = "Apple";
              symbol-link = "https://www.google.com/search?tbm=nws&q=apple";
            }
          ];
        }
        {
          type = "to-do";
        }
        {
          type = "hacker-news";
          limit = 15;
          collapse-after = 5;
        }
        {
          type = "lobsters";
          limit = 15;
          collapse-after = 5;
        }
      ];
    }
    {
      size = "full";
      widgets = [
        {
          type = "search";
          search-enging = "duckduckgo";
          autofocus = true;
        }
        {
          type = "monitor";
          cache = "5m";
          title = "Services";
          # style = "compact";
          sites = [
            {
              title = "Gitea";
              url = "https://gitea.nuc.lab";
              icon = "sh:gitea";
            }
            {
              title = "Gitea local";
              url = "http://localhost:3000";
              icon = "sh:gitea";
            }
            {
              title = "Paperless";
              url = "https://paperless.nuc.lab";
              icon = "sh:paperless-ngx";
            }
            {
              title = "Stirling PDF";
              url = "https://pdf.nuc.lab";
              icon = "sh:stirling-pdf";
            }
          ];
        }
        {
          type = "bookmarks";
          groups = [
            {
              title = "Uni";
              links = [
                {
                  title = "VC";
                  url = "https://google.com";
                }
              ];
            }
          ];
        }
        {
          type = "releases";
          show-source-icon = true;
          limit = 10;
          collapse-after = 5;
          repositories = [
            "YaLTeR/niri"
            "helix-editor/helix"
            # "go-gitea/gitea"
            # "glanceapp/glance"
          ];
        }
        # {
        #   type = "dns-stats";
        #   service = "adguard";
        #   url = "adguard.nuc.lab";
        #   username = "admin";
        #   password = "\${ADGUARD_PASSWORD}";
        #   hour-format = "24h";
        # }
        {
          type = "server-stats";
          servers = [
            {
              type = "local";
              hide-swap = true;
              hide-mountpoints-by-default = true;
              mountpoints = {
                "/" = {
                  name = "root";
                  hide = false;
                };
              };
            }
            {
              type = "remote";
              url = "http://100.78.152.127:27973";
              token = "8h8jBUG#Q34gsJ";
            }
          ];
        }
        {
          type = "markets";
          chart-link-template = "https://www.tradingview.com/chart/?symbol={SYMBOL}";
          symbol-link-template = "https://www.google.com/search?tbm=nws&q={SYMBOL}";
          markets = [
            {
              symbol = "SPY";
              name = "S&P 500";
            }
            {
              symbol = "BTC-EUR";
              name = "Bitcoin";
              chart-link = "https://www.tradingview.com/chart/?symbol=INDEX:BTCEUR";
            }
            {
              symbol = "NVDA";
              name = "NVIDIA";
            }
            {
              symbol = "AAPL";
              name = "Apple";
              symbol-link = "https://www.google.com/search?tbm=nws&q=apple";
            }
          ];
        }
        {
          type = "to-do";
        }
        {
          type = "hacker-news";
          limit = 15;
          collapse-after = 5;
        }
        {
          type = "lobsters";
          limit = 15;
          collapse-after = 5;
        }
      ];
    }
  ];
}
