{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "battery-toggle" ''
      # BAT_PATH=$(find /sys/bus/platform/drivers/ideapad_acpi -name "conservation_mode" | head -n 1) # doesnt work??
      MODE_PATH="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"

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
}
