{
  services.adguardhome = {
    enable = true;
    host = "0.0.0.0";
    port = 3001;
    mutableSettings = true;
    extraArgs = [ ];
    settings = {
      dns = {
        port = 54;
      };
    };
  };
}
