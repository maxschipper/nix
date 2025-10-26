{ lib, ... }:
{
  services.ttyd = {
    enable = true;
    port = lib.mkDefault 7681;
    writeable = lib.mkDefault false;
  };
}
