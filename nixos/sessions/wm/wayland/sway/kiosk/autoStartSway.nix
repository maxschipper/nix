{
  programs.fish.loginShellInit = ''
    if test (tty) = "/dev/tty1"
      exec sway
    end
  '';
}
