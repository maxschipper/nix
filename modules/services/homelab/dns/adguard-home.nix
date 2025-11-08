{
  services.adguardhome = {
    enable = true;
    host = "0.0.0.0";
    port = 3000;
    mutableSettings = true;
    extraArgs = [ ];
    settings = { };
  };
}
