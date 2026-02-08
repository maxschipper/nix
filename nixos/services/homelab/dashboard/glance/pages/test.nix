let
  test = import ../widgets/custom/steam-specials.nix;
  tail = import ../widgets/custom/tailscale-devices.nix;
in
{
  name = "Test";
  hide-desktop-navigation = true;
  head-widgets = [
  ];
  columns = [
    {
      # LEFT COLUMN
      size = "full";
      widgets = [
        test
        tail
      ];
    }
  ];

}
