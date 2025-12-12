let
  domain = "nuc.lab";
in
{
  type = "dns-stats";
  service = "adguard";
  url = "https://adguard.${domain}";
  username = "max";
  password = "";
  hour-format = "24h";
  hide-graph = false;
  hide-top-domains = false;
}
