{ pkgs, ... }:
{
  # use nwg-look to set gtk theme and icon thme

  environment.systemPackages = with pkgs; [
    fluent-icon-theme
    # fluent-gtk-theme

    whitesur-icon-theme
    whitesur-gtk-theme
    # whitesur-kde

    # kora-icon-theme

    colloid-icon-theme # icon theme
    colloid-gtk-theme # gtk-theme
  ];
}
