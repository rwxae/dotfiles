{ ... }:

{
  imports = [ ../../home/linux ];

  services.ollama = {
    enable = true;
  };

  programs.btop.settings.shown_boxes = "proc cpu mem net gpu0";

  wayland.windowManager.hyprland.settings.monitor = [
    {
      output = "DP-4";
      mode = "2560x1440@180";
      position = "1920x0";
      scale = 1.25;
    }
    {
      output = "DP-5";
      mode = "1920x1080@144";
      position = "0x180";
      scale = 1;
    }
  ];
}
