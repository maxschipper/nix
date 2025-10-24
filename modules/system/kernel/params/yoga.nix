{
  imports = [
    ./default.nix
  ];
  boot.kernelParams = [
    # "quiet"
    "amd_pstate=active"
    "resume_offset=533760"
  ];
  boot.resumeDevice = "/dev/mapper/crypted"; # + kenerlParam resume_offset
}
