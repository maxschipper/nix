{
  imports = [
    ./default.nix
  ];
  boot.kernelParams = [
    # "quiet"
    "amd_pstate=active"
    "resume_offset=533760"

    # default 3548010 =~ 13,5gb
    # 20gb
    # "ttm.pages_limit=5242880"
    # "ttm.page_pool_size=5242880"
    # 24gb
    "ttm.pages_limit=6291456"
    "ttm.page_pool_size=6291456"

  ];
  boot.resumeDevice = "/dev/mapper/crypted"; # + kenerlParam resume_offset
}
