{
  programs.foot = {
    enable = true;
    enableFishIntegration = true;
    theme = "catppuccin-macchiato";
    settings = {
      main = {
        pad = "15x15";
        font = "JetBrains Mono Nerd Font:size=13";
        dpi-aware = "no";
        bold-text-in-bright = "palette-based";
      };
      scrollback.multiplier = 10;
      cursor = {
        style = "beam";
        blink = "no";
        unfocused-style = "hollow";
      };
      mouse.hide-when-typing = "yes";
      colors = {
        alpha = 0.9;
        background = "1e1e2e";
      };
      key-bindings = {
        scrollback-up-page = "Shift+Page_Up";
        clipboard-copy = "Control+Shift+c";
        clipboard-paste = "Control+Shift+v Control+V";
        search-start = "Control+Shift+f";

      };
    };
  };
}
