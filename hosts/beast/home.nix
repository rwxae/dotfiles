{ ... }:

{
  imports = [ ../../home/linux ];

  services.ollama = {
    enable = true;
  };

  programs.btop.settings.shown_boxes = "proc cpu mem net gpu0";

  wayland.windowManager.hyprland.settings.monitor = [
    # TODO:
    # {
    #   output = "CHANGE_ME";
    #   mode = "2560x1440@180";
    #   position = "0x0";
    #   scale = 1;
    # }
    # {
    #   output = "DP-4";
    #   mode = "1920x1080@144";
    #   position = "2560x180";
    #   scale = 1;
    # }
    {
      output = "DP-4";
      mode = "1920x1080@144";
      position = "0x0";
      scale = 1;
    }
  ];
}
