{ inputs, pkgs, ... }:
{
  imports = [ inputs.nix-index-database.nixosModules.nix-index ];
  programs.nix-index-database.comma.enable = true;

  programs.command-not-found.enable = false;
  environment.systemPackages = [
    (pkgs.writeTextFile {
      name = "My-comma-command-not-found-fish";
      destination = "/share/fish/vendor_functions.d/fish_command_not_found.fish";
      text = ''
        function fish_command_not_found
          echo "Command not found"
          comma --print-packages $argv
        end
      '';
    })
  ];
}
