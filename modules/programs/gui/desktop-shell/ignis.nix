{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    # Python environment containing Ignis + extra packages
    (pkgs.python3.withPackages (ps: [
      ps.jedi-language-server
      ps.python-lsp-server
      ps.ruff
      ps.pillow
      ps.jinja2
      ps.materialyoucolor
      # Ignis Python package
      (inputs.ignis.packages.${pkgs.system}.default.override {
        enableAudioService = true;
        enableNetworkService = true;
        enableBluetoothService = true;
        useDartSass = true;
        extraPackages = [ ]; # extra packages already listed above
      })
    ]))

    # Optional: add Ignis CLI globally too
    (inputs.ignis.packages.${pkgs.system}.default.override {
      enableAudioService = true;
      enableNetworkService = true;
      enableBluetoothService = true;
      useDartSass = false;
      useGrassSass = true;
      extraPackages = [ ];
    })

    pkgs.ty
  ];

}
