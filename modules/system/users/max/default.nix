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
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAU9NWmeaFYU/OhqLLJwKTHxtK91WG3UeebMWVVu+SSK max@yoga"
    ];
  };
}
