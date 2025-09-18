{
  boot.kernelParams = [
    # "quiet"
    "8250.nr_uarts=0"
    "console=tty0"
    "amd_pstate=active"
    "resume_offset=533760"
  ];
  boot.resumeDevice = "/dev/mapper/crypted"; # + kenerlParam resume_offset
}
