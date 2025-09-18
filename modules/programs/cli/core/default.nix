{ pkgs, ... }:
{
  environment.sessionVariables = {
    EDITOR = "hx";
  };

  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      user.name = "Max S";
      user.email = "150921823+maxschipper@users.noreply.github.com";
    };
  };

  environment.systemPackages = with pkgs; [
    helix
    gh
    lsd
    wget
    curl
    tldr
    ripgrep
    fd
    btop
    fzf
  ];
}
