{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wtype
  ];
  home-manager.users.max.wayland.windowManager.sway.config =
    let
      cmd =
        let
          wobVol = "wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ v=int($2 * 100); if ($3 == \"[MUTED]\") print v \" muted\"; else print v }' > $XDG_RUNTIME_DIR/wob.sock";
          wobBright = "busctl --user get-property ${_wlgamma} Brightness | awk '{print int($2 * 100)}' > $XDG_RUNTIME_DIR/wob.sock";
          _wlgamma = "rs.wl-gammarelay / rs.wl.gammarelay";
        in
        {
          vol = {
            up = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+ && ${wobVol}";
            down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && ${wobVol}";
            mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && ${wobVol}";
          };
          bright = {
            down = "busctl --user -- call ${_wlgamma} UpdateBrightness d -0.1 && ${wobBright}";
            up = "busctl --user -- call ${_wlgamma} UpdateBrightness d 0.1 && ${wobBright}";
          };
        };
      key = {
        yt = "XF86CameraAccessDisable";
        netflix = "XF86CameraAccessToggle";
        power = "error, bind keycode 160 instead of this sym"; # the sym is not working but the keycode is
        source = "XF86MediaSelectTV";
        select = "XF86Select";
        back = "XF86Back";
        home = "XF86HomePage";
        audio = {
          raise = "XF86AudioRaiseVolume";
          lower = "XF86AudioLowerVolume";
          mute = "XF86AudioMute";
        };
      };
    in
    {
      keybindings = {
        # ${key.power} = "power key only with keycode";
        ${key.audio.raise} = "exec ${cmd.vol.up}";
        ${key.audio.lower} = "exec ${cmd.vol.down}";
        ${key.audio.mute} = "exec ${cmd.vol.mute}";

        ${key.select} = "exec wtype -k Return";
        ${key.back} = "exec wtype -k BackSpace";
        ${key.home} = "exec wtype -k Escape";
        ${key.yt} = "exec wtype -P Return -s 1000 -p Return";

        ${key.source} = "mode extra_controls";

        "Mod4+t" = "exec foot";
        "Mod4+Shift+q" = "exec swaymsg exit";
        "Mod4+q" = "kill";
      };
      modes."extra_controls" = {
        ${key.audio.raise} = "exec ${cmd.bright.up}";
        ${key.audio.lower} = "exec ${cmd.bright.down}";
        ${key.audio.mute} = "exec systemctl --user restart wob.service";

        ${key.source} = "mode default";
        ${key.back} = "mode default";
        ${key.home} = "mode default";
        "Escape" = "mode default";
      };
      keycodebindings =
        let
          keyCode.power = "160";
        in
        {
          ${keyCode.power} = "exec swaymsg exit";
        };
    };
}
