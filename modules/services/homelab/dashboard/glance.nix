{
  services.glance = {
    enable = true;
    openFirewall = false;
    settings = {
      server = {
        host = "0.0.0.0";
        port = 5678;
      };
      # pages = [
      #   {
      #     name = "Calendar";
      #     columns = [
      #       {
      #         size = "full";
      #         widgets = [
      #           {
      #             type = "calendar";
      #           }
      #         ];
      #       }
      #     ];
      #   }
      #   {
      #     name = "Calendar2";
      #     columns = [
      #       {
      #         size = "full";
      #         widgets = [
      #           {
      #             type = "calendar";
      #           }
      #         ];
      #       }
      #     ];
      #   }
      # ];
    };
  };
}
