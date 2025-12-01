{
  programs.foot = {
    enable = true;
    enableFishIntegration = true;
    # theme = "catppuccin-macchiato"; # overwrites background color
    settings = {
      main = {
        pad = "10x10";
        font = "JetBrains Mono Nerd Font:size=13";
        dpi-aware = "no";
        bold-text-in-bright = "palette-based";
      };
      scrollback = {
        multiplier = 10;
        lines = 10000;
      };
      cursor = {
        style = "beam";
        blink = "no";
        unfocused-style = "hollow";
      };
      mouse.hide-when-typing = "yes";
      colors = {
        alpha = 1.0;
        # background = "1d1f21";
        background = "000000";
      };
      key-bindings = {
        scrollback-up-page = "Page_Up";
        scrollback-down-page = "Page_Down";
        clipboard-copy = "Control+Shift+c";
        clipboard-paste = "Control+Shift+v Control+v";
        search-start = "Control+Shift+f";
        spawn-terminal = "Alt+t";
      };
    };
  };
}
