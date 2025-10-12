{
  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    # XDG_CONFIG_DIRS = "/etc/xdg";
    XDG_CONFIG_HOME = "$HOME/.config";
    # XDG_DATA_DIRS = "/usr/local/share/:/usr/share/";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    CARGO_HOME = "$XDG_DATA_HOME/cargo";
    HISTFILE = "$XDG_STATE_HOME/bash/history";
    GOPATH = "$XDG_DATA_HOME/go";
    XCOMPOSECACHE = "$XDG_CACHE_HOME/X11/xcompose";
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java";
    PARALLEL_HOME = "$XDG_CONFIG_HOME/parallel";
    PYTHON_HISTORY = "";
    RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
  };

}
