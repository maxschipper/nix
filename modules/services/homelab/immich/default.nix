{
  services.immich = {
    enable = true;
    port = 2283;
    host = "0.0.0.0";
    mediaLocation = "/var/lib/immich";
    # accelerationDevices = [ "/dev/dri/renderD128" ];
    accelerationDevices = null;
    # machine-learning = {
    #   enable = true;
    #   # environment = {
    #     # MACHINE_LEARNING_MODEL_TTL = "600";
    #   # };
    # };
    settings = {
      server.externalDomain = "https://immich.nuc.lab";
    };
  };

  users.users.immich.extraGroups = [
    "video"
    "render"
  ];
}
