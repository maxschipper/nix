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
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet \
                    --xsessions ${config.services.displayManager.sessionData.desktops}/share/xsessions \
                    --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions \
                    --remember \
                    --remember-user-session \
                    --time \
                    --user-menu \
                    --asterisks \
                    --asterisks-char • \
                    --window-padding 2 \
                    --container-padding 4 \
                    --prompt-padding 1 \
        '';
        user = "greeter";
        # --theme "text=white;time=lightblue;container=black;border=darkgray;title=darkgray;prompt=darkgray;input=darkgray;action=lightred;button=darkgray"
      };
    };
  };
  # text      -Base text color other than those specified below
  # time      -Color of the date and time. If unspecified, falls back to text
  # container -Background color for the centered containers used throughout the app
  # border    -Color of the borders of those containers
  # title     -Color of the containers' titles. If unspecified, falls back to border
  # greet     -Color of the issue of greeting message. If unspecified, falls back to text
  # prompt    -Color of the prompt ("Username:", etc.)
  # input     -Color of user input feedback
  # action    -Color of the actions displayed at the bottom of the screen
  # button    -Color of the keybindings for those actions. If unspecified, falls back to action

  # Black
  # Red
  # Green
  # Yellow
  # Blue
  # Magenta
  # Cyan
  # Gray
  # DarkGray
  # LightRed
  # LightGreen
  # LightYellow
  # LightBlue
  # LightMagenta
  # LightCyan
}
