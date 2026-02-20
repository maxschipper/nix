{ pkgs, ... }:
{
  imports = [
    ./autoStartSway.nix
    ./config.nix
    ./keybinds.nix
    ./wob.nix
    ./yt.nix
  ];

  security.polkit.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    # xwayland.enable = false;
    extraPackages = with pkgs; [
      # i3status
      # i3status-rust
      # rofi
      # wmenu
      foot
    ];
  };
}
