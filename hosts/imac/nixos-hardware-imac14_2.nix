{ config, ... }:
{
  boot = {
    initrd.kernelModules = [
      "applesmc"
      "applespi"
      "intel_lpss_pci"
      "spi_pxa2xx_platform"
      "kvm-intel"
    ];
    blacklistedKernelModules = [
      "b43"
      "ssb"
      "brcmfmac"
      "brcmsmac"
      "bcma"
    ];
    extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  };
}
