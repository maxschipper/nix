{ pkgs, config, ... }:
{
  imports = [
    ./greetd.nix
  ];
  services.greetd = {
    useTextGreeter = true;
    settings = {
      default_session = {
        # command = "${pkgs.greetd}/bin/agreety --cmd sway";
        # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd hyprland";
        command = "${pkgs.tuigreet}/bin/tuigreet --xsessions ${config.services.displayManager.sessionData.desktops}/share/xsessions --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session";
        user = "greeter";
      };
    };
  };

}
