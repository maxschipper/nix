{
  imports = [ ./. ];
  services.netbird = {
    useRoutingFeatures = "server";
    ui.enable = false;
  };
}
