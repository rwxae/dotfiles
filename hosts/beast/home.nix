{ ... }:

{
  imports = [ ../../home/linux ];

  services.ollama = {
    enable = true;
  };

  programs.btop.settings.shown_boxes = "proc cpu mem net gpu0";
}
