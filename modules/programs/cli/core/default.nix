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

  environment.systemPackages = [
    pkgs.helix
    pkgs.yazi
    pkgs.git
    pkgs.gh
    pkgs.lazygit
    pkgs.difftastic
    pkgs.lsd
    pkgs.wget
    pkgs.curl
    pkgs.tldr
    pkgs.ripgrep
    pkgs.fd
    pkgs.btop
    pkgs.fzf
  ];
}
