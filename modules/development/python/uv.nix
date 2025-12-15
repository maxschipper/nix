{ pkgs, lib, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      uv
    ];
    variables = {
      UV_PYTHON_DOWNLOADS = "never";
    };
    localBinInPath = lib.mkDefault true;
  };
}
