{
  home-manager.users.max.programs.hyprlock = {
    enable = true;
    settings = {

      "$font" = "Noto Sans";

      general = {
        hide_cursor = true;
        ignore_empty_input = true;
        immediate_render = false;
        fail_timeout = 2000;
      };

      # broken
      # animations = {
      #   enabled = true;
      #   fade_in = {
      #     duration = 300;
      #     bezier = "easeOutQuint";
      #   };
      #   fade_out = {
      #     duration = 300;
      #     bezier = "easeOutQuint";
      #   };
      # };

      background = [
        {
          path = "screenshot";
          # path = "~/Pictures/Wallpapers/wallhaven-5g9rl7_2880x1800.png";
          blur_passes = 5;
          blur_size = 8;
          noise = 0.02;
          brightness = 0.8;
          vibrancy = 0.2;
          contrast = 0.9;
          color = "color = rgba(0, 0, 0, 1.0)"; # shows until the resource at path is ready, in niri lock is red
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "15%, 5%";
          outline_thickness = 3;

          # rounding = 15
          rounding = -1;

          outer_color = "rgba(c2c1ffee) rgba(f5b2e0ee) 45deg";
          # outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          # inner_color = "rgba(0, 0, 0, 0.0)"; # no fill
          inner_color = "rgba(80, 80, 80, 0.3)";

          check_color = "rgba(00ff9966) rgba(00ffff66) 120deg";
          fail_color = "rgba(ff6633ff) rgba(ff0066ff) 40deg";

          # shadow_passes = 2;

          font_color = "rgb(143, 143, 143)";
          fade_on_empty = true;

          font_family = "$font";
          placeholder_text = "Input password...";
          fail_text = "$PAMFAIL";

          # uncomment to use a letter instead of a dot to indicate the typed password
          # dots_text_format = *
          # dots_size = 0.4
          dots_spacing = 0.3;
          # dots_center = false;

          # uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
          # hide_input = true;

          # position = "0, -300";
          # halign = "center";
          # valign = "center";
          position = "0, 200";
          halign = "center";
          valign = "bottom";
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          font_size = "180";
          font_family = "$font";
          position = "0, -20%";
          halign = "center";
          valign = "top";
          shadow_passes = 6;
          color = "rgba(60, 60, 60, 1.0)";
        }
        {
          monitor = "";
          text = "cmd[update:60000] date +'%A, %d %B %Y'"; # update every 60 seconds
          font_size = 30;
          font_family = "$font";
          position = "0, -38%";
          halign = "center";
          valign = "top";
          color = "rgba(60, 60, 60, 1.0)";
        }
      ];
    };

  };
}
