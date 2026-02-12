_:
{
  type = "server-stats";
  hide-header = true;
  servers = [
    {
      type = "local";
      hide-swap = true;
      hide-mountpoints-by-default = true;
      mountpoints = {
        "/" = {
          name = "root";
          hide = false;
        };
      };
    }
    # {
    #   type = "remote";
    #   url = "http://100.78.152.127:27973";
    #   token = "8h8jBUG#Q34gsJ";
    # }
  ];
}
