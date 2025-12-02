{ ... }:

{
  imports = [ ../../home/linux ];

  services.ollama = {
    enable = true;
  };
}
