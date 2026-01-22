{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "battery-toggle" ''
      # BAT_PATH=$(find /sys/bus/platform/drivers/ideapad_acpi -name "conservation_mode" | head -n 1) # doesnt work??
      BAT_PATH="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"

      if [ -z "$BAT_PATH" ]; then
        echo "Error: Lenovo conservation mode not found."
        exit 1
      fi

      STATUS=$(cat "$BAT_PATH")

      if [ "$1" == "status" ]; then
        if [ "$STATUS" -eq 1 ]; then
          echo "Limited (Safe)"
        else
          echo "Full (100%)"
        fi
      else
        if [ "$STATUS" -eq 1 ]; then
          echo 0 | sudo tee "$BAT_PATH" > /dev/null
          echo "Conservation Mode OFF. Charging to 100%."
        else
          echo 1 | sudo tee "$BAT_PATH" > /dev/null
          echo "Conservation Mode ON. Battery limited."
        fi
      fi
    '')
  ];
}
