{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "max" ];

  virtualisation = {
    libvirtd.enable = true;
    # spiceUSBRedirection.enable = true;
  };
}
