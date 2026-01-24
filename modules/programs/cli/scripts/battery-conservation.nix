{ pkgs, ... }:
let
  conservationModePath = "/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode";
in
{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "battery-toggle" ''
      MODE_PATH="${conservationModePath}"

      if [ -z "$MODE_PATH" ]; then
        echo "Error: Lenovo conservation mode not found."
        exit 1
      fi

      MODE_STATUS=$(cat "$MODE_PATH")

      if [ "$1" == "-h" ]; then
        echo "usage: $0 status|toggle|limit|full"
      elif [ "$1" == "status" ]; then
        if [ "$MODE_STATUS" -eq 1 ]; then
          echo "Limited (80%)" # 80% in my case (lenovo yoga 7 2in1 14AKP10)
        else
          echo "Full (100%)"
        fi
      elif [ "$1" == "toggle" ]; then
        if [ "$MODE_STATUS" -eq 1 ]; then
          echo 0 | sudo tee "$MODE_PATH" > /dev/null
          echo "Conservation Mode OFF. Charging to 100%."
        else
          echo 1 | sudo tee "$MODE_PATH" > /dev/null
          echo "Conservation Mode ON. Battery limited."
        fi
      elif [ "$1" == "limit" ]; then
          echo 1 | sudo tee "$MODE_PATH" > /dev/null
          echo "Conservation Mode ON. Battery limited."
      elif [ "$1" == "full" ]; then
          echo 0 | sudo tee "$MODE_PATH" > /dev/null
          echo "Conservation Mode OFF. Charging to 100%."
      fi
    '')
  ];

  systemd.services.battery-conservation = {
    description = "Enable Lenovo battery conservation mode on startup";
    wantedBy = [ "multi-user.target" ];
    after = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c 'echo 1 > ${conservationModePath}'";
    };
  };

  # security.sudo.extraRules = [
  #   {
  #     users = [ "max" ];
  #     commands = [
  #       {
  #         command = "/run/current-system/sw/bin/tee /sys/bus/platform/drivers/ideapad_acpi/*/conservation_mode";
  #         options = [ "NOPASSWD" ];
  #       }
  #     ];
  #   }
  # ];
}
