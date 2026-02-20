{
  home-manager.users.max.services.wob = {
    enable = true;
    settings = {
      "" = {
        width = 50;
        height = 400;
        timeout_msec = 1500;
        anchor = "right";
        margin = 20;
        orientation = "vertical";
      };
      "style.muted" = {
        # background_color = "032cfc";
        background_color = "00000000";
        bar_color = "555555FF";
        border_color = "555555FF";
      };
    };
  };
}
