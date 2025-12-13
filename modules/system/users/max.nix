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
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMUjYI40HHTczZP7f7zS83yQkWtTJsnruKZ7Fny8Mj1/ root@laptop"
    ];
  };
}
