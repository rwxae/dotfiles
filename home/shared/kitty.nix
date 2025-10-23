{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      disable_ligatures = "always";
      font_features = "none";
      confirm_os_window_close = "0";
    };
  };
}
