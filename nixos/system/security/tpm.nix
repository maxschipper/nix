{ pkgs, ... }:
{
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true; # expose /run/current-system/sw/lib/libtpm2_pkcs11.so
    tctiEnvironment.enable = true; # TPM2TOOLS_TCTI and TPM2_PKCS11_TCTI env variables
  };
  users.users.max.extraGroups = [ "tss" ]; # tss group has access to TPM devices

  environment.systemPackages = [
    pkgs.tpm2-tools
    # pkgs.tpm2-tss
  ];
}
