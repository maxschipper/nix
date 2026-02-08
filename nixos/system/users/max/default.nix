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
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA0CLY5h1CNx2tx4uvfkabFqgAtW31KcZVHQB/6MLDrm max@nuc"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIABviA4sJnOLoK6uqFmmB+5if7TAgFbnawwZmaGx0WMP u0_a235@tablet"
    ];
  };
}
