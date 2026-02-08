{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    GDK_BACKEND = "wayland,x11";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    NO_AT_BRIDGE = "1"; # disables gtk accessibility features
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
}
