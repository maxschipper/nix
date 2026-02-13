{
  services.kanata = {
    enable = false;
    keyboards = {
      "yoga" = {
        config = builtins.readFile ./config.kbd;
        devices = [
          # "/dev/input/by-id/usb-0000_0000-event-kbd"
        ];
        extraArgs = [ ];
        # extraDefCfg = "danger-enable-cmd yes";
        port = null;
      };
    };
  };
}
