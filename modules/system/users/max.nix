{
  users.users.max = {
    isNormalUser = true;
    description = "Max";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "input"
      "storage"
    ];
  };
}
