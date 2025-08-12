{ pkgs, ... }:
{
  environment.sessionVariables = {
    EDITOR = "hx";
  };

  environment.systemPackages = with pkgs; [
    helix
    git
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
