{ pkgs, lib, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      uv
    ];
    sessionVariables = {
      UV_PYTHON_DOWNLOADS = "never";
    };
    localBinInPath = lib.mkDefault true;
  };
}
