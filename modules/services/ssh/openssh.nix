{
  services.openssh.enable = true;
  users.users.max.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMUjYI40HHTczZP7f7zS83yQkWtTJsnruKZ7Fny8Mj1/ root@laptop"
  ];
}
