{
  programs.foot = {
    enable = true;
    enableFishIntegration = true;
    # theme = "catppuccin-macchiato"; # overwrites background color
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
        alpha = 0.6;
        background = "1d1f21";
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
